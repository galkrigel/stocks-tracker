import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_tracker/models/stock/stock.dart';
import 'package:stock_tracker/providers/stock_provider.dart';
import 'package:stock_tracker/widgets/stock_item/stock_item.dart';

class StocksList extends ConsumerWidget {
  const StocksList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stocks = ref.watch(stockProvider).stocks;

    return stocks.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.separated(
            shrinkWrap: true,
            itemCount: stocks.length,
            itemBuilder: (context, index) {
              Stock item = stocks[index];
              return StockItem(
                stock: item,
                index: index,
              );
            },
            separatorBuilder: (context, index) => Divider(
              color: Colors.grey[300],
            ),
          );
  }
}
