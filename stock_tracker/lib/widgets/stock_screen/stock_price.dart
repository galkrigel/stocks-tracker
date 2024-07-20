import 'package:flutter/material.dart';

class StockPrice extends StatelessWidget {
  const StockPrice({
    super.key,
    required this.currency,
    required this.currentPrice,
    required this.percentageChange,
    required this.differenceFromYesterday,
    required this.differenceSign,
    required this.differenceColor,
  });

  final String currency;
  final double currentPrice;
  final double percentageChange;
  final double differenceFromYesterday;
  final String differenceSign;
  final Color differenceColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          //  crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            animation(
              Text(currentPrice.toStringAsFixed(2),
                  key: ValueKey<double>(currentPrice),
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.w900)),
            ),
            const SizedBox(width: 10),
            Text(currency, style: const TextStyle(fontSize: 15)),
          ],
        ),
        Row(
          children: [
            animation(
               Text(
                key: ValueKey<double>(differenceFromYesterday),
                '$differenceSign${differenceFromYesterday.toStringAsFixed(2)} ($differenceSign${percentageChange.toStringAsFixed(2)}%)',
                style: TextStyle(color: differenceColor),
              ),
            ),
            const SizedBox(width: 5),
            const Text('Today')
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: 100,
          height: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Colors.grey.shade400,
              width: 1,
            ),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                animation(
                  Text(
                    '$differenceSign${percentageChange.toStringAsFixed(2)}%',
                    key: ValueKey<double>(percentageChange),
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  'Today',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }


}

 AnimatedSwitcher animation(Text text) {
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 600), child: text);
  }