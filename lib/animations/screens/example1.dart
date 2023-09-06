import 'package:flutter/material.dart';

import 'components/product_card.dart';

class SomeAnimationScreen extends StatelessWidget {
  const SomeAnimationScreen({super.key});

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
        for (Map<String, dynamic> product in products)
          // 1 PONTO DE IPC (WIDGET ANIMADO) //
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(milliseconds: 3000),
            builder: ((context, value, child) {
              return Opacity(
                opacity: value,
                child: ProdutCard(product: product),
              );
            }),
          ),
      ]),
    );
  }
}
