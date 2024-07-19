import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_tracker/models/stock/stock.dart';
import 'package:stock_tracker/widgets/stock_item/stock_item.dart';
import 'package:stock_tracker/providers/stocks_provider.dart';

class StocksList extends ConsumerWidget {
  const StocksList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stocks = ref.watch(stocksProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stocks tracker'),
      ),
      body: stocks.when(
        data: (stocks) {
          return ListView.separated(
            shrinkWrap: true,
            itemCount: stocks.length,
            itemBuilder: (context, index) {
              Stock item = stocks[index];
              return StockItem(
                stock: item,
              );
            },
            separatorBuilder: (context, index) =>
                Divider(color: Colors.grey[300]),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Text('Error: $error'),
      ),
    );
  }
}
