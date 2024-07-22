import 'dart:async';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:stock_tracker/api_config.dart';
import 'package:stock_tracker/consts.dart';
import 'package:stock_tracker/models/stock/stock.dart';
import 'dart:convert';

class StockNotifier extends ChangeNotifier {
  List<Stock> _stocks = [];
  Timer? _timer;
  final _numberOfHistoricalPoints = 20;
  final Random _random = Random();
  final stockSymbols = Consts.stockSymbols;

  List<Stock> get stocks => _stocks;

  StockNotifier() {
    _fetchStocks();
    _startPriceUpdates();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _fetchStocks() async {
    String apiKey = dotenv.env['FINNHUB_API_KEY'] ?? '';

    List<Stock> stocks = [];

    for (String symbol in stockSymbols) {
      String profileUrl = ApiConfig.getProfileUrl(symbol, apiKey);
      String quoteUrl = ApiConfig.getQuoteUrl(symbol, apiKey);

      http.Response profileResponse = await http.get(Uri.parse(profileUrl));
      http.Response quoteResponse = await http.get(Uri.parse(quoteUrl));

      if (profileResponse.statusCode == 200 &&
          quoteResponse.statusCode == 200) {
        Map<String, dynamic> profileData = json.decode(profileResponse.body);
        Map<String, dynamic> quoteData = json.decode(quoteResponse.body);

        // Generate random price history to show in the StockGraph
        List<FlSpot> priceHistory = historicalData(symbol);

        Stock stock = Stock.fromJson(profileData, quoteData, priceHistory);

        priceHistory
            .add(FlSpot(_numberOfHistoricalPoints + 1, stock.currentPrice));
        stock = stock.copyWith(priceHistory: priceHistory);

        stocks.add(stock);
      } else {
        print('Failed to load stock data for $symbol');
      }
    }
    _stocks = stocks;
    notifyListeners();
  }

  void _startPriceUpdates() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      _updatePrices();
    });
  }

  void _updatePrices() {
    for (int i = 0; i < _stocks.length; i++) {
      var stock = _stocks[i];

      // Generate a price change between -1 to 1
      final priceChange = (_random.nextDouble() - 0.5) * 2;
      stock = stock.copyWith(currentPrice: stock.currentPrice + priceChange);
      if (stock.currentPrice > stock.high) {
        stock = stock.copyWith(high: stock.currentPrice);
      }
      if (stock.currentPrice < stock.low) {
        stock = stock.copyWith(low: stock.currentPrice);
      }
      final percentageChange = (stock.currentPrice - stock.previousClose) /
          stock.previousClose *
          100;
      stock = stock.copyWith(percentageChange: percentageChange);
      _stocks[i] = stock;
    }
    notifyListeners();
  }

  List<FlSpot> historicalData(String symbol) {
    List<FlSpot> spots = [];
    for (int i = 0; i < _numberOfHistoricalPoints; i++) {

      // Generate random price between 100 and 300
      spots.add(
        FlSpot(i.toDouble(), _random.nextDouble() * 200 + 100),
      );
    }
    return spots;
  }
}

final stockProvider =
    ChangeNotifierProvider<StockNotifier>((ref) => StockNotifier());
