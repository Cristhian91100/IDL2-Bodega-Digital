import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bodega_digital/views/product_list_screen.dart';
import 'package:bodega_digital/view_models/product_view_model.dart';

void main() {
  runApp(BodegaDigitalApp());
}

class BodegaDigitalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductViewModel()),
      ],
      child: MaterialApp(
        title: 'Bodega Digital',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ProductListScreen(),
      ),
    );
  }
}
