import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
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
      onPressed: cart.totalQuantity <= 0
          ? null
          : () {
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
        style: TextStyle(
            color: cart.totalQuantity <= 0
                ? Colors.grey
                : Theme.of(context).primaryColor),
      ),
    );
  }
}
