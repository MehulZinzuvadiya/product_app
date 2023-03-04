import 'package:flutter/material.dart';

import '../model/productModel.dart';

class HomeProvider extends ChangeNotifier {
  List<ProductModel> productData = [
    ProductModel(name: "Watermelon", price: 400, img: "🍉", q: 1),
    ProductModel(name: "Graps", price: 150, img: "🍇", q: 1),
    ProductModel(name: "Mango", price: 200, img: "🥭", q: 1),
    ProductModel(name: "Banana", price: 40, img: "🍌", q: 1),
    ProductModel(name: "Apple", price: 120, img: "🍎", q: 1),
    ProductModel(name: "Kiwi", price: 180, img: "🥝", q: 1),
    ProductModel(name: "Strawberry", price: 310, img: "🍓", q: 1),
    ProductModel(name: "PineApple", price: 525, img: "🍍", q: 1),
    ProductModel(name: "Lemon", price: 1000, img: "🍋", q: 1),
    ProductModel(name: "Melon", price: 140, img: "🍈", q: 1),
  ];

  List<ProductModel> cartData = [];

  void addcart(ProductModel p1) {
    cartData.add(p1);
    notifyListeners();
  }

  void updateQa(int index, ProductModel p1) {
    productData[index] = p1;
    notifyListeners();
  }
}
