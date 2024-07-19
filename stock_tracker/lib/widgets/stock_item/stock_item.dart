import 'package:flutter/material.dart';
import 'package:stock_tracker/models/stock/stock.dart';
import 'package:stock_tracker/widgets/stock_item/stock_graph.dart';
import 'package:stock_tracker/widgets/stock_screen/stock_screen.dart';

class StockItem extends StatelessWidget {
  const StockItem({super.key, required this.stock});

  final Stock stock;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StockScreen(stock),
        ),
      ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(stock.name),
              Text(stock.ticker),
            ],
          ),
          SizedBox(
            height: 50,
            width: 50,
            child: StockGraph(stock.priceHistory),
          )
        ],
      ),
      leading: Image.network(stock.logoUrl),
      trailing: Column(
        children: [
          Text('${stock.currentPrice.toStringAsFixed(2)} ${stock.currency}'),
          Text(
            '${stock.differenceSign}${stock.differenceFromYesterday.toStringAsFixed(2)} (${stock.percentageChange.toStringAsFixed(2)}%)',
            style: TextStyle(color: stock.differenceColor),
          ),
        ],
      ),
    );
  }
}
