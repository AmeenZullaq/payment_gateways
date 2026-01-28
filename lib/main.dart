import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payments/features/payment/presentation/pages/my_cart_page.dart';

void main() {
  Stripe.publishableKey =
      "pk_test_51StPgTReBDqicCUZWBCf0RacjfOULrcPyvgMowSCD0Hokj1ui2IwRy28R8YhALjUIVcxZU4ruw0ZuX5qyq4viEBW006cFMLUEv";
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyCartPage());
  }
}
