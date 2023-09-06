import 'package:flutter/material.dart';

import '../models/items.dart';
import '_components/custom_button.dart';

class ListButtonScreen extends StatelessWidget {
  const ListButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Item> items = [
      const Item(name: "1", value: 1),
      const Item(name: "2", value: 2),
      const Item(name: "3", value: 3),
      const Item(name: "4", value: 4),
      const Item(name: "5", value: 5),
    ];
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => CustomButton(
          // 1 PONTO DE IPC (ACOPLAMENTO) //
          onPressedArgument: () {
            print("Item list index: $index");
          },
          titleButton: "Botão ${index + 1}",
        ),
      ),
    );
  }
}
