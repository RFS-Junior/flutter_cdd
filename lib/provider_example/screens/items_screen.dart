import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/items.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 1 PONTO DE ICP (GEREN. ESTADO) //
    return ChangeNotifierProvider<Items>(
      create: (context) => Items(),
      // 2 PONTO DE ICP (GEREN. ESTADO) //
      child: Consumer<Items>(
        builder: (context, value, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Items'),
            ),
            body: ListView.builder(
              shrinkWrap: true,
              itemCount: value.items.length,
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemBuilder: (context, index) =>
                  Text("Item: ${value.items[index].toString()}"),
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () => value.add(value.items.length + 1),
              label: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
