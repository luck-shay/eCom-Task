import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_item.dart';
import 'cart_screen.dart';

class ProductListScreen extends StatelessWidget {
  final List<Product> loadedProducts = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      price: 29.99,
      imageUrl: 'https://via.placeholder.com/150/FF0000/FFFFFF?text=Red+Shirt',
    ),
    Product(
      id: 'p2',
      title: 'Blue Jeans',
      price: 59.99,
      imageUrl: 'https://via.placeholder.com/150/0000FF/FFFFFF?text=Blue+Jeans',
    ),
    // Add more products here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter eCommerce'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: loadedProducts.length,
        itemBuilder: (ctx, i) => ProductItem(
          loadedProducts[i].id,
          loadedProducts[i].title,
          loadedProducts[i].price,
          loadedProducts[i].imageUrl,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
