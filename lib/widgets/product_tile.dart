import 'package:flutter/material.dart';


class ProductTile extends StatelessWidget {
  final String name;
  final double price;  

 
  const ProductTile({super.key, required this.name, required this.price});

@override
Widget build(BuildContext context) {
  return ListTile(
    title: Text(name),  // Nombre del producto
    subtitle: Text('Price: \$${price.toString()}'),  // Precio del producto
    trailing: Image.asset(
      'assets/your_cart_icon.png', // Dirección de la imagen del carrito
      width: 24,  // Ancho de la imagen
      height: 24,  // Alto de la imagen
    ),
    onTap: () {
      // Acción al hacer clic (puedes agregar la lógica de agregar al carrito)
    },
  );
}
}
