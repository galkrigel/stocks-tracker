import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_tracker/providers/stock_provider.dart';
import 'package:stock_tracker/widgets/stock_item/stock_graph.dart';
import 'package:stock_tracker/widgets/stock_screen/price_line_chart.dart';
import 'package:stock_tracker/widgets/stock_screen/stock_header.dart';
import 'package:stock_tracker/widgets/stock_screen/stock_price.dart';

class StockScreen extends ConsumerWidget {
  const StockScreen(this.index, {super.key});

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stock = ref.watch(stockProvider).stocks[index];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            StockHeader(
                name: stock.name,
                ticker: stock.ticker,
                exchange: stock.exchange,
                logo: stock.logoUrl),
            StockPrice(
              currency: stock.currency,
              currentPrice: stock.currentPrice,
              percentageChange: stock.percentageChange,
              differenceFromYesterday: stock.differenceFromYesterday,
              differenceSign: stock.differenceSign,
              differenceColor: stock.differenceColor,
            ),
            SizedBox(
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: StockGraph(stock.priceHistory),
            ),
            const Spacer(),
            const Row(
              children: [
                Text(
                  "High/Low",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(width: 2),
                Icon(
                  Icons.info_outline,
                  size: 18,
                ),
              ],
            ),
            SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: PriceLineChart(
                currentPrice: stock.currentPrice,
                lowPrice: stock.low,
                highPrice: stock.high,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                actionButton('BUY'),
                const SizedBox(width: 8),
                actionButton('SELL'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget actionButton(String text) {
    return Expanded(
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 8, 40, 87),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.all(16),
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
          )),
    );
  }
}
