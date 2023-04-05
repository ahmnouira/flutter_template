import 'package:flutter/material.dart';
import 'package:flutter_template/src/features/items/models/item_model.dart';
import 'package:flutter_template/src/providers/curd_provider.dart';
import 'package:provider/provider.dart';

class ItemProvider extends CurdProvider<ItemModel> {
  static ItemProvider of(BuildContext context, {bool listen = false}) {
    return Provider.of(context, listen: listen);
  }
}

/// Consumer: listens for [GroceryConsumer] stats changes
/// You should ONLY wrap a Consumer around widgets that need it.
class ItemConsumer extends StatelessWidget {
  final Widget Function(ItemProvider provider) builder;

  const ItemConsumer({super.key, required this.builder});

  @override
  Widget build(BuildContext context) => Consumer<ItemProvider>(
        builder: (_, provider, __) => builder(provider),
      );
}
