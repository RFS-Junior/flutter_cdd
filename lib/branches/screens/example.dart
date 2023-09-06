import 'package:flutter/material.dart';

class SomeScreen extends StatelessWidget {
  const SomeScreen({super.key});

  static final List<Map<String, dynamic>> products = [
    {
      'name': 'Cell Phone Model X',
      'price': 1200.00,
      'brand': 'Brand A',
      'year': 2022,
    },
    {
      'name': 'Ultra Y Laptop',
      'price': 1800.00,
      'brand': 'Brand B',
      'year': 2021,
    },
    {
      'name': 'Z Headphones',
      'price': 99.90,
      'brand': 'Brand C',
      'year': 2023,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        // 1 PONTO DE ICP (BRANCH) //
        for (Map<String, dynamic> product in products)
          ProdutCard(product: product),
      ]),
    );
  }
}

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
        // 1 PONTO DE ICP (BRANCH) //
        children: product.entries.map((element) {
          return Text(
            "${element.key}: ${element.value}",
            // 1 PONTO DE ICP (BRANCH) //
            style: element.key == 'name'
                ? const TextStyle(fontWeight: FontWeight.bold)
                : null,
          );
        }).toList(),
      ),
    );
  }
}
