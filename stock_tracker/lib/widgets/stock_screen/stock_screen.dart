import 'package:flutter/material.dart';
import 'package:stock_tracker/models/stock/stock.dart';
import 'package:stock_tracker/widgets/stock_item/stock_graph.dart';
import 'package:stock_tracker/widgets/stock_screen/price_line_chart.dart';
import 'package:stock_tracker/widgets/stock_screen/stock_header.dart';
import 'package:stock_tracker/widgets/stock_screen/stock_price.dart';

class StockScreen extends StatefulWidget {
  const StockScreen(this.stock, {super.key});

  final Stock stock;

  @override
  State<StockScreen> createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  @override
  Widget build(BuildContext context) {
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
                name: widget.stock.name,
                ticker: widget.stock.ticker,
                exchange: widget.stock.exchange,
                logo: widget.stock.logoUrl),
            StockPrice(
              currency: widget.stock.currency,
              currentPrice: widget.stock.currentPrice,
              percentageChange: widget.stock.percentageChange,
              differenceFromYesterday: widget.stock.differenceFromYesterday,
              differenceSign: widget.stock.differenceSign,
              differenceColor: widget.stock.differenceColor,
            ),
            SizedBox(
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: StockGraph(widget.stock.priceHistory),
            ),
            // SizedBox(
            //   height: 150,
            //   width: MediaQuery.of(context).size.width,
            //   child: SliderGraph(
            //     currentPrice: widget.stock.currentPrice,
            //     lowPrice: widget.stock.low,
            //     highPrice: widget.stock.high,
            //   ),
            // ),
            const Spacer(),
            Row(
              children: [
                Expanded(
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
                      child: const Text(
                        'BUY',
                        style: TextStyle(fontSize: 16),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
