import 'dart:async';

import 'package:flutter/material.dart';

import '../models/items.dart';

class ItemAsyncScreen extends StatefulWidget {
  const ItemAsyncScreen({super.key});

  @override
  State<ItemAsyncScreen> createState() => _ItemAsyncScreenState();
}

class _ItemAsyncScreenState extends State<ItemAsyncScreen> {
  final List<Item> items = [];
  // 2 PONTO DE ICP (FUNÇÃO ASSÍCRONA) //
  final StreamController<double> streamController = StreamController<double>();

  // 2 PONTO DE ICP (FUNÇÃO ASSÍCRONA) //
  Future<List<Item>> getListItems() async {
    // simulation of waiting for a web resource
    await Future.delayed(const Duration(seconds: 5));

    // simulating the return of a web resource
    items.addAll(const [
      Item(name: "Item 1", value: 1),
      Item(name: "Item 2", value: 2),
      Item(name: "Item 3", value: 3),
      Item(name: "Item 4", value: 4),
      Item(name: "Item 5", value: 5),
    ]);

    // add new event to stream
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
              child: StreamBuilder<double>(
                stream: streamController.stream,
                builder: (context, snapshot) {
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
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(snapshot.data![index].name),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
