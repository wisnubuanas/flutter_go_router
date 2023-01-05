import 'package:flutter/material.dart';
import 'package:flutter_go_router/models/product_model.dart';
import 'package:go_router/go_router.dart';

// import '../models/product_model.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({
    Key? key,
    required this.Category,
    required this.asc,
    required this.quantity,
  }) : super(key: key);

  final String Category;
  final bool asc;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    List<Product> products = Product.products
        .where(((Product) => Product.category == Category))
        .where(((Product) => Product.quantity == quantity))
        .toList();

    products.sort(
      (a, b) => a.name.compareTo(b.name),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(Category),
        backgroundColor: const Color(0xFF000A1F),
        actions: [
          IconButton(
            onPressed: () {
              String sort = asc ? "desc" : "asc";
              return context.goNamed(
                "product_list",
                params: <String, String>{"category": Category},
                queryParams: <String, String>{"sort": sort},
              );
            },
            icon: const Icon(Icons.sort),
          ),
          IconButton(
            onPressed: () {
              String sort = asc ? "desc" : "asc";
              return context.goNamed(
                "product_list",
                params: <String, String>{"category": Category},
                queryParams: <String, String>{"filter": "10"},
              );
            },
            icon: const Icon(Icons.filter_alt),
          ),
        ],
      ),
      body: ListView(
        children: [
          for (final Product product in asc ? products : products.reversed)
            ListTile(
              title: Text(product.name),
            )
        ],
      ),
    );
  }
}
