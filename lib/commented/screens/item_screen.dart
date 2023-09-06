import 'dart:async';

import 'package:flutter/material.dart';

import '../models/items.dart';
import '_components/custom_button.dart';

//// CARGA COGNITIVA TOTAL = 15 PONTOS ////
class CommentedExampleScreen extends StatefulWidget {
  const CommentedExampleScreen({super.key});

  @override
  State<CommentedExampleScreen> createState() => _CommentedExampleScreenState();
}

class _CommentedExampleScreenState extends State<CommentedExampleScreen> {
  final List<Item> items = [];
  // 2 PONTO DE ICP (FUNÇÃO ASSÍCRONA) //
  // 1 PONTO DE ICP (NULLABLE) //
  final StreamController<double?> streamController = StreamController<double>();

  // 2 PONTO DE ICP (FUNÇÃO ASSÍCRONA) //
  Future<List<Item>> getListItems() async {
    await Future.delayed(const Duration(seconds: 5));

    items.addAll(const [
      Item(name: "Item 1", value: 1),
      Item(name: "Item 2", value: 2),
      Item(name: "Item 3", value: 3),
      Item(name: "Item 4", value: 4),
      Item(name: "Item 5", value: 5),
    ]);

    streamController.add(items.last.value);

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              // 2 PONTO DE ICP (WIDGET ASSÍCRONO) //
              child: StreamBuilder<double?>(
                stream: streamController.stream,
                builder: (context, snapshot) {
                  // 1 PONTO DE ICP (BRANCH) //
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          LinearProgressIndicator(),
                          Text("Aguarde uma função Stream..."),
                        ],
                      ),
                    );
                  }
                  return Text("Último item: ${snapshot.data.toString()}");
                },
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.9,
              // 2 PONTO DE ICP (WIDGET ASSÍCRONO) //
              child: FutureBuilder<List<Item>>(
                future: getListItems(),
                builder: (context, snapshot) {
                  // 1 PONTO DE ICP (BRANCH) //
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          Text("Aguarde uma função Future..."),
                        ],
                      ),
                    );
                  }
                  return Column(
                    children: [
                      // 1 PONTO DE IPC (BRANCH) //
                      for (Item item in snapshot.data!)
                        // 1 PONTO DE IPC (WIDGET ANIMADO) //
                        TweenAnimationBuilder<double>(
                          tween: Tween<double>(begin: 0, end: 1),
                          duration: const Duration(milliseconds: 3000),
                          builder: ((context, value, child) => Opacity(
                                opacity: value,
                                child: Text(
                                  item.name,
                                  // 1 PONTO DE IPC (BRANCH) //
                                  style: item.value % 2 == 0
                                      ? const TextStyle(
                                          fontWeight: FontWeight.bold)
                                      : null,
                                ),
                              )),
                        ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        // 1 PONTO DE IPC (ACOPLAMENTO) //
        onPressedArgument: () {
          print("Hello!");
        },
        labelButton: const Icon(Icons.print),
      ),
    );
  }
}
