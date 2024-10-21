
import 'package:flutter/material.dart';
import 'package:bodega_digital/models/product.dart';

class ProductViewModel extends ChangeNotifier {
  
  final List<Product> _cartItems = []; 

  List<Product> get cartItems => _cartItems;


  void addToCart(Product product) {
    _cartItems.add(product);
    notifyListeners(); 
  }

 
  void removeFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }


  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  
  int get cartItemCount => _cartItems.length;

  get totalPrice => null;

  bool? get isLoading => null;

  get products => null;

  get totalCartPrice => null;

  void updateQuantity(product, int i) {}
}
