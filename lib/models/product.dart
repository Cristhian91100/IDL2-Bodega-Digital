// lib/models/product.dart

class Product {
  final int id;
  final String name;
  final double price;
  final int stock; // Aquí agregamos la propiedad stock

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.stock, // Asegúrate de inicializar stock en el constructor
  });

  // Método para convertir un mapa JSON en un objeto Product
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      stock: json['stock'],  // Asegúrate de que el JSON contenga este campo
    );
  }

  get product => null;

  get quantity => null;
}
