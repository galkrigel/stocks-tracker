import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stock_tracker/consts.dart';
part 'stock.freezed.dart';

@freezed
class Stock with _$Stock {
  const Stock._();

  const factory Stock({
    required String name,
    required String ticker,
    required double currentPrice,
    required double previousClose,
    required String logoUrl,
    required double high,
    required double low,
    required String currency,
    required double percentageChange,
    required List<FlSpot> priceHistory,
    required String exchange,
  }) = _Stock;

  @override
  factory Stock.fromJson(Map<String, dynamic> profileData,
      Map<String, dynamic> quoteData, List<FlSpot> priceHistory) {
    return Stock(
        name: profileData['name'],
        ticker: profileData['ticker'],
        currentPrice: quoteData['c'].toDouble(),
        previousClose: quoteData['pc'].toDouble(),
        logoUrl: profileData['logo'],
        high: quoteData['h'].toDouble(),
        low: quoteData['l'].toDouble(),
        currency: profileData['currency'],
        exchange: profileData['exchange'],
        percentageChange: quoteData['dp'].toDouble(),
        priceHistory: priceHistory);
  }

  double get differenceFromYesterday => currentPrice - previousClose;

  String get differenceSign => differenceFromYesterday > 0 ? '+' : '';

  Color get differenceColor =>
      percentageChange > 0 ? UiColors.green : UiColors.red;
}
