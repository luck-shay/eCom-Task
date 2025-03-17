import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'screens/product_list_screen.dart';
import 'screens/cart_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'eCommerce Task',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Lato',
        ),
        home: ProductListScreen(),
        routes: {
          CartScreen.routeName: (ctx) => CartScreen(),
        },
      ),
    );
  }
}
