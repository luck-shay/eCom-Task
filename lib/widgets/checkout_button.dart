import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final CartProvider cart;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Checkout successful!'),
            duration: Duration(seconds: 2),
          ),
        );
        cart.clear();
      },
      child: Text(
        'CHECKOUT',
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
    );
  }
}
