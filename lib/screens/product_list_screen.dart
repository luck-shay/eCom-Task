import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../models/product.dart';
import '../widgets/product_item.dart';
import '../widgets/badge.dart' as customBadge;
import 'cart_screen.dart';

class ProductListScreen extends StatelessWidget {
  final List<Product> loadedProducts = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      price: 29.99,
      imageUrl: 'assets/images/red-shirt.avif',
    ),
    Product(
      id: 'p2',
      title: 'Blue T-shirt',
      price: 29.99,
      imageUrl: 'assets/images/blue-tshirt.webp',
    ),
    Product(
      id: 'p3',
      title: 'Blue Jeans',
      price: 59.99,
      imageUrl: 'assets/images/blue-jeans.webp',
    ),
    Product(
      id: 'p4',
      title: 'White Shoes',
      price: 29.99,
      imageUrl: 'assets/images/white-shoes.webp',
    ),
    Product(
      id: 'p5',
      title: 'Black Boots',
      price: 59.99,
      imageUrl: 'assets/images/black-boots.webp',
    ),
    Product(
      id: 'p6',
      title: 'Silver Watch',
      price: 59.99,
      imageUrl: 'assets/images/silver-watch.webp',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Commerce Task'),
        actions: [
          Consumer<CartProvider>(
            builder: (_, cart, ch) => customBadge.Badge(
              color: Colors.white,
              child: ch!,
              value: cart.totalQuantity.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
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
          crossAxisCount: 1,
          childAspectRatio: 0.75,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
