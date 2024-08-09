class ProdukModel {
  final DateTime createdAt;
  final String name;
  final int harga;
  final String id;

  ProdukModel({
    required this.createdAt,
    required this.name,
    required this.harga,
    required this.id,
  });

  factory ProdukModel.fromJson(Map<String, dynamic> json) {
    return ProdukModel(
      createdAt: DateTime.parse(json['createdAt']),
      name: json['name'],
      harga: json['harga'],
      id: json['id'],
    );
  }
}
