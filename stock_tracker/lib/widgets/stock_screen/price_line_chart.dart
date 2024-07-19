// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// class SliderGraph extends StatelessWidget {
//   final double currentPrice;
//   final double lowPrice;
//   final double highPrice;

//   const SliderGraph({
//     Key? key,
//     required this.currentPrice,
//     required this.lowPrice,
//     required this.highPrice,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Calculate positions on the x-axis
//     double lowPosition = 0.0;
//     double highPosition = 1.0;
//     double currentPosition = (currentPrice - lowPrice) / (highPrice - lowPrice);

//     return Container(
//       padding: const EdgeInsets.all(16.0),
//       child: Stack(
//         children: [
//           // Draw the LineChart
//           LineChart(
//             LineChartData(
//               gridData: FlGridData(show: false),
//               titlesData: FlTitlesData(
//                 bottomTitles: AxisTitles(
//                   sideTitles: SideTitles(
//                     showTitles: true,
//                     reservedSize: 40,
//                    // axisTitleWidget: Container(),
//                     // sideTitleWidget: (value, meta) {
//                     //   String title;
//                     //   if (value == lowPosition) {
//                     //     title = 'Low';
//                     //   } else if (value == highPosition) {
//                     //     title = 'High';
//                     //   } else if (value == currentPosition) {
//                     //     title = 'Current';
//                     //   } else {
//                     //     return Container(); // Hide other titles
//                     //   }
//                     //   return SideTitleWidget(
//                     //     axisSide: meta.axisSide,
//                     //     child: Text(
//                     //       title,
//                     //       style: TextStyle(fontSize: 14, color: Colors.black),
//                     //     ),
//                     //   );
//                     // },
//                   ),
//                 ),
//                 leftTitles: AxisTitles(
//                   sideTitles: SideTitles(showTitles: false),
//                 ),
//                 rightTitles: AxisTitles(
//                   sideTitles: SideTitles(showTitles: false),
//                 ),
//               ),
//               borderData: FlBorderData(show: false),
//               lineBarsData: [
//                 LineChartBarData(
//                   spots: [
//                     FlSpot(lowPosition, currentPrice),
//                     FlSpot(highPosition, currentPrice),
//                   ],
//                   isCurved: false,
//                   color: Colors.blue,
//                   dotData: FlDotData(show: false),
//                   belowBarData: BarAreaData(show: false),
//                 ),
//               ],
//               lineTouchData: LineTouchData(enabled: false),
//               minX: lowPosition - 0.1,
//               maxX: highPosition + 0.1,
//               minY: currentPrice - 10, // Adjust as needed
//               maxY: currentPrice + 10, // Adjust as needed
//             ),
//           ),
//           // Draw the Arrow
//           Positioned(
//             left: MediaQuery.of(context).size.width * currentPosition,
//             bottom: 0,
//             child: Icon(
//               Icons.arrow_forward,
//               color: Colors.red,
//               size: 30,
//             ),
//           ),
//           // Draw the Numbers
//           Positioned(
//             left: 0,
//             bottom: 0,
//             child: Text(
//               lowPrice.toStringAsFixed(2),
//               style: const TextStyle(fontSize: 14, color: Colors.black),
//             ),
//           ),
//           Positioned(
//             right: 0,
//             bottom: 0,
//             child: Text(
//               highPrice.toStringAsFixed(2),
//               style: const TextStyle(fontSize: 14, color: Colors.black),
//             ),
//           ),
//           Positioned(
//             left: MediaQuery.of(context).size.width * currentPosition - 15, // Adjust as needed
//             bottom: 0,
//             child: Text(
//               currentPrice.toStringAsFixed(2),
//               style: const TextStyle(fontSize: 14, color: Colors.black),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
