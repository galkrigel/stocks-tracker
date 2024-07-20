import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PriceLineChart extends StatelessWidget {
  final double lowPrice;
  final double highPrice;
  final double currentPrice;

  const PriceLineChart({
    super.key,
    required this.lowPrice,
    required this.highPrice,
    required this.currentPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.elliptical(20, 20)),
        border: Border.all(
          color: Colors.grey[300]!,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LineChart(
          LineChartData(
            gridData: const FlGridData(show: false),
            titlesData: FlTitlesData(
              topTitles: AxisTitles(
                axisNameWidget: const Text(
                  "Day's Range",
                  style: TextStyle(color: Colors.grey),
                ),
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    if (value == lowPrice) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 48.0),
                        child: Text(lowPrice.toStringAsFixed(2),
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      );
                    } else if (value == highPrice) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 48.0),
                        child: Text(highPrice.toStringAsFixed(2),
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
              leftTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            borderData: FlBorderData(show: false),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(lowPrice, 0),
                  FlSpot(currentPrice, 0),
                  FlSpot(highPrice, 0),
                ],
                dotData: FlDotData(
                  show: true,
                  getDotPainter: (spot, percent, barData, index) {
                    if (spot.x == currentPrice) {
                      return FlDotCirclePainter(
                        radius: 6,
                        color: Colors.blue,
                      );
                    } else {
                      return FlDotCirclePainter(
                        radius: 0,
                      );
                    }
                  },
                ),
                barWidth: 8,
                color: Colors.grey[300],
              ),
            ],
            minX: lowPrice,
            maxX: highPrice,
            minY: -1,
            maxY: 1,
          ),
        ),
      ),
    );
  }
}
