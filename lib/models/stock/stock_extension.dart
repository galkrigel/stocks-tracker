import 'package:flutter/material.dart';
import 'package:stock_tracker/consts.dart';
import 'stock.dart'; 

extension StockExtensions on Stock {
  double get differenceFromYesterday => currentPrice - previousClose;

  String get differenceSign => differenceFromYesterday > 0 ? '+' : '';

  Color get differenceColor => percentageChange > 0 ? UiColors.green : UiColors.red;
}