import 'package:bodega_digital/views/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/product_view_model.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productViewModel = Provider.of<ProductViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Productos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: (productViewModel.isLoading ?? false)
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: productViewModel.products.length,
              itemBuilder: (context, index) {
                final product = productViewModel.products[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('Precio: \$${product.price}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          if (product.quantity > 1) {
                            productViewModel.updateQuantity(product, -1);
                          }
                        },
                      ),
                      Text(product.quantity.toString()),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          if (product.quantity < product.stock) {
                            productViewModel.updateQuantity(product, 1);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('No hay suficiente stock'),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                  onTap: () {
                    productViewModel.addToCart(product);
                  },
                );
              },
            ),
    );
  }
}
