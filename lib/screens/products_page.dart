import 'package:flutter/material.dart';
import '../widgets/product_card.dart';
import '../data/product_data.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Products'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(product: product);
        },
      ),
    );
  }
}
