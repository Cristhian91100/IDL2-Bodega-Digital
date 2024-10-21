import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/product_view_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productViewModel = Provider.of<ProductViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de Compras'),
      ),
      body: productViewModel.cartItems.isEmpty
          ? const Center(child: Text('El carrito está vacío'))
          : ListView.builder(
              itemCount: productViewModel.cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = productViewModel.cartItems[index];
                return ListTile(
                  title: Text(cartItem.name),
                  subtitle: Text('Cantidad: ${cartItem.quantity}'),
                  trailing: Text('Precio: \$${cartItem.price}'),
                );
              },
            ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: Text(
          'Total: \$${productViewModel.totalCartPrice}',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
