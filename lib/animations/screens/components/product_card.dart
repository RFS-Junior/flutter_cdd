import 'package:flutter/material.dart';

class ProdutCard extends StatelessWidget {
  const ProdutCard({super.key, required this.product});

  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      color: Colors.red[200],
      width: 200,
      height: 100,
      child: Column(
        children: product.entries.map((element) {
          return Text(
            "${element.key[0].toUpperCase() + element.key.substring(1)}: ${element.value}",
            style: element.key == 'name'
                ? const TextStyle(fontWeight: FontWeight.bold)
                : null,
          );
        }).toList(),
      ),
    );
  }
}
