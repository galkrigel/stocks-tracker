import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StockGraph extends StatelessWidget {
  const StockGraph(this.priceHistory, {super.key});

  final List<FlSpot> priceHistory;

  @override
  Widget build(BuildContext context) {
    Color color = Colors.green;
    Color gradiantColor = Colors.green.shade200;
    if (priceHistory[0].y > priceHistory[priceHistory.length - 1].y) {
      color = Colors.red;
      gradiantColor = Colors.red.shade200;
    }

    return priceHistory.isEmpty
        ? Container()
        : LineChart(
            LineChartData(
              gridData: const FlGridData(show: false),
              titlesData: const FlTitlesData(show: false),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
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
                        gradiantColor.withOpacity(0.3),
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
