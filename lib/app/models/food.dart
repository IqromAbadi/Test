class Food {
  final String id;
  final String name;
  final int price;

  Food({
    required this.id,
    required this.name,
    required this.price,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['id'],
      name: json['name'],
      price: int.tryParse(json['price'].toString()) ?? 0,
    );
  }
}
