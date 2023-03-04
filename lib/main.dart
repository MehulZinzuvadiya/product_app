import 'package:flutter/material.dart';
import 'package:product_app/screen/view/cartScreen.dart';
import 'package:product_app/screen/view/dataScreen.dart';
import 'package:product_app/screen/view/homeScreen.dart';
import 'package:product_app/screen/provider/home_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => HomeProvider(),
    child: MaterialApp(debugShowCheckedModeBanner: false, routes: {
      '/': (context) => homeScreen(),
      'fruitdata': (context) => FruitData(),
      'cart': (context) => CartScreen(),
    }),
  ));
}
