class Item {
  final String name;
  final double value;

  const Item({required this.name, required this.value});

  Item fromJson(Map<String, dynamic> json) {
    return Item(name: json["name"], value: json["value"]);
  }

  Map<String, dynamic> toJson(Item item) {
    return {
      "name": item.name,
      "value": item.value,
    };
  }
}
