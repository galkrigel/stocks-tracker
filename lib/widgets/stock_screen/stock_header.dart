import 'package:flutter/material.dart';
import 'package:stock_tracker/consts.dart';
import 'package:stock_tracker/widgets/stock_item/stock_item.dart';

class StockHeader extends StatelessWidget {
  const StockHeader(
      {super.key,
      required this.name,
      required this.ticker,
      required this.exchange,
      required this.logo});

  final String name;
  final String ticker;
  final String exchange;
  final String logo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      isThreeLine: true,
      leading: companyLogo(logo),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              overflow: TextOverflow.ellipsis,
              name,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            ticker,
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            exchange,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          IntrinsicWidth(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                color: UiColors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: UiColors.orange,
                  width: 1,
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.sunny, size: 12, color: UiColors.orange),
                    Text(
                      "Market Open",
                      style: TextStyle(
                        fontSize: 10,
                        color: UiColors.orange,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
