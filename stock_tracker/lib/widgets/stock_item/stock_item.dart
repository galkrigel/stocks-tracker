import 'package:flutter/material.dart';
import 'package:stock_tracker/models/stock/stock.dart';
import 'package:stock_tracker/widgets/stock_item/stock_graph.dart';
import 'package:stock_tracker/widgets/stock_screen/stock_price.dart';
import 'package:stock_tracker/widgets/stock_screen/stock_screen.dart';

class StockItem extends StatelessWidget {
  const StockItem({super.key, required this.stock, required this.index});

  final Stock stock;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StockScreen(index),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stock.name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(stock.ticker),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            width: 80,
            child: StockGraph(stock.priceHistory),
          )
        ],
      ),
      leading:
          SizedBox(width: 50, height: 50, child: Image.network(stock.logoUrl)),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          animation(Text(
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            '${stock.currentPrice.toStringAsFixed(2)} ${stock.currency}',
            key: ValueKey<double>(
              stock.currentPrice,
            ),
          )),
          animation(
            Text(
              key: ValueKey<double>(stock.differenceFromYesterday),
              '${stock.differenceSign}${stock.differenceFromYesterday.toStringAsFixed(2)} (${stock.percentageChange.toStringAsFixed(2)}%)',
              style: TextStyle(
                color: stock.differenceColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
