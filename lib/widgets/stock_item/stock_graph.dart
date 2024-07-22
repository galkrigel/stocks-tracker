import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stock_tracker/consts.dart';

class StockGraph extends StatelessWidget {
  const StockGraph(this.priceHistory, {super.key});

  final List<FlSpot> priceHistory;

  @override
  Widget build(BuildContext context) {
    Color color = UiColors.green;
    Color gradiantColor = UiColors.green.withOpacity(0.1);
    if (priceHistory.isNotEmpty &&
        priceHistory[0].y > priceHistory[priceHistory.length - 1].y) {
      color = UiColors.red;
      gradiantColor = UiColors.red.withOpacity(0.1);
    }

    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            barWidth: 1,
            spots: priceHistory,
            isCurved: true,
            color: color,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              color: gradiantColor,
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  gradiantColor.withOpacity(0.1),
                  gradiantColor.withOpacity(0.2),
                  gradiantColor.withOpacity(0.3),
                  gradiantColor.withOpacity(0.4),
                  gradiantColor.withOpacity(0.5),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
