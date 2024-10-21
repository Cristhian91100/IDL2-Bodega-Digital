
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductService {
  // URL de la API
  final String _baseUrl = 'https://shop-api-roan.vercel.app/product';

  Future<List<Product>> fetchProducts({int page = 1, int pageSize = 10}) async {
    final url = '$_baseUrl?page=$page&pageSize=$pageSize';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
     
      final List<dynamic> productList = json.decode(response.body);
      
      return productList.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
