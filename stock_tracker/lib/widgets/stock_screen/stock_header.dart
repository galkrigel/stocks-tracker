import 'package:flutter/material.dart';

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
      leading: Image.network(logo),
      title: Row(
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
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
          Container(
            width: 100,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.orange.shade100,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.orange,
                width: 1,
              ),
            ),
            child: const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.sunny, size: 12, color: Colors.orange),
                  Text(
                    "Market Open",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
