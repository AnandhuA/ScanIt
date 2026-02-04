class ProductModel {
  final String id;
  final String code;
  final String name;
  final String brand;
  final String imageUrl;
  final String quantity;

  final double energyKcal;
  final double fat;
  final double sugar;
  final double protein;
  final double salt;

   final Map<String, dynamic> rawData;

  ProductModel({
    required this.id,
    required this.code,
    required this.name,
    required this.brand,
    required this.imageUrl,
    required this.quantity,
    required this.energyKcal,
    required this.fat,
    required this.sugar,
    required this.protein,
    required this.salt,
      required this.rawData,
  });

  /// Convert JSON → Model
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final nutriments = json['nutriments'] ?? {};

    return ProductModel(
      id: json['_id'] ?? '',
      code: json['code'] ?? '',
      name: json['product_name'] ?? 'Unknown',
      brand: json['brands'] ?? 'Unknown',
      imageUrl: json['image_url'] ?? '',
      quantity: json['quantity'] ?? '',

      energyKcal: _toDouble(nutriments['energy-kcal']),
      fat: _toDouble(nutriments['fat']),
      sugar: _toDouble(nutriments['sugars']),
      protein: _toDouble(nutriments['proteins']),
      salt: _toDouble(nutriments['salt']),

       rawData: Map<String, dynamic>.from(json),
    );
  }

  /// Safe double parser
  static double _toDouble(dynamic value) {
    if (value == null) return 0.0;

    if (value is int) return value.toDouble();
    if (value is double) return value;

    return double.tryParse(value.toString()) ?? 0.0;
  }
}
