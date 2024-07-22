import 'package:flutter/material.dart';
import 'package:stock_tracker/consts.dart';
import 'package:stock_tracker/models/stock/stock.dart';
import 'package:stock_tracker/models/stock/stock_extension.dart';
import 'package:stock_tracker/widgets/stock_item/company_logo.dart';
import 'package:stock_tracker/widgets/stock_item/stock_graph.dart';
import 'package:stock_tracker/widgets/stock_screen/stock_price.dart';
import 'package:stock_tracker/widgets/stock_screen/stock_screen.dart';

class StockItem extends StatelessWidget {
  const StockItem({super.key, required this.stock, required this.index});

  final Stock stock;
  final int index;

  @override
  Widget build(BuildContext context) {
    String priceChangeText =
        '${stock.differenceSign}${stock.differenceFromYesterday.toStringAsFixed(2)} (${stock.percentageChange.toStringAsFixed(2)}%)';
    String currentPriceText =
        '${stock.currentPrice.toStringAsFixed(2)} ${stock.currency}';
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
                ),
                Row(
                  children: [
                    Text(stock.ticker,
                        style: TextStyle(color: Colors.grey[700])),
                    const SizedBox(width: 4),
                    Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: UiColors.orange.withOpacity(0.2),
                          border: Border.all(
                              color: UiColors.orange.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.sunny,
                          size: 12,
                          color: UiColors.orange,
                        )),
                  ],
                ),
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
      leading: CompanyLogo(stock.logoUrl),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          animation(Text(
            style: const TextStyle(
              fontSize: 14,
            ),
            currentPriceText,
            key: ValueKey<double>(
              stock.currentPrice,
            ),
          )),
          animation(
            Text(
              priceChangeText,
              key: ValueKey<double>(stock.differenceFromYesterday),
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
