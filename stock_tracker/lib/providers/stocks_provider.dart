import 'dart:convert';
import 'package:fl_chart/fl_chart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:stock_tracker/models/stock/stock.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final stocksProvider = FutureProvider<List<Stock>>((ref) async {
  List<String> stockSymbols = ['AAPL', 'GOOGL', 'MSFT'];
  String apiKey = dotenv.env['FINNHUB_API_KEY'] ?? '';

  List<Stock> stocks = [];

  for (String symbol in stockSymbols) {
    String profileUrl =
        'https://finnhub.io/api/v1/stock/profile2?symbol=$symbol&token=$apiKey';
    String quoteUrl =
        'https://finnhub.io/api/v1/quote?symbol=$symbol&token=$apiKey';

    http.Response profileResponse = await http.get(Uri.parse(profileUrl));
    http.Response quoteResponse = await http.get(Uri.parse(quoteUrl));

    if (profileResponse.statusCode == 200 && quoteResponse.statusCode == 200) {
      Map<String, dynamic> profileData = json.decode(profileResponse.body);
      Map<String, dynamic> quoteData = json.decode(quoteResponse.body);
      List<FlSpot> priceHistory;
      try {
        priceHistory = await fetchHistoricalData(symbol);
      } catch (e) {
        priceHistory = [];
      }

      Stock stock = Stock.fromJson(profileData, quoteData, priceHistory);
      stocks.add(stock);
    } else {
      print('Failed to load stock data for $symbol');
    }
  }
  return stocks;
});

Future<List<FlSpot>> fetchHistoricalData(String symbol) async {
  String apiKey = dotenv.env['ALPHAVANTAGE_API_KEY'] ?? '';
  String historicalUrl =
      'https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=$symbol&apikey=$apiKey';

  try {
// The real api is limitied to 25 requests per day, so this is just for the development
    List<FlSpot> spots = [];
    spots.add(
      FlSpot(1, 30),
    );
    spots.add(
      FlSpot(2, 40),
    );
    spots.add(
      FlSpot(3, 50),
    );
    spots.add(
      FlSpot(4, 35),
    );
    spots.add(
      FlSpot(5, 67),
    );
    spots.add(
      FlSpot(6, 80),
    );
    spots.add(
      FlSpot(7, 105),
    );
    spots.add(
      FlSpot(8, 70),
    );

    // http.Response response = await http.get(Uri.parse(historicalUrl));

    // if (response.statusCode == 200) {
    //   Map<String, dynamic> data = json.decode(response.body);

    //   // Check if the data contains the expected fields
    //   if (data['Time Series (Daily)'] == null) {
    //     throw Exception('No data available');
    //   }

    //   Map<String, dynamic> timeSeries = data['Time Series (Daily)'];
    //   List<FlSpot> spots = [];

    //   timeSeries.forEach((date, values) {
    //     double price = double.parse(values['4. close']); // Closing price
    //     DateTime dateTime = DateTime.parse(date);
    //     double timestamp = dateTime.millisecondsSinceEpoch.toDouble();
    //     spots.add(FlSpot(timestamp, price));
    //   });

    //   return spots;
    // } else {
    //   throw Exception('Failed to load historical data');
    // }
    return spots;
  } catch (e) {
    throw Exception('Error fetching historical data');
  }
}
