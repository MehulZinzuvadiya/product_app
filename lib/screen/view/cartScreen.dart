import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product_app/screen/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../model/productModel.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  HomeProvider? homeProvider;
  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo.shade600,
          title: Text("Cart",
              style: GoogleFonts.poppins(
                color: Colors.white,
              )),
          centerTitle: true,
        ),
        body: Consumer<HomeProvider>(
          builder: (context, value, child) => ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                    leading: Text("${homeProvider!.productData[index].img}",
                        style: TextStyle(fontSize: 30)),
                    title: Text("${homeProvider!.productData[index].name}",
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w800)),
                    subtitle: Text("${homeProvider!.productData[index].price}",
                        style: TextStyle(
                          fontSize: 18,
                        )),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              ProductModel p1 = ProductModel(
                                  img: homeProvider!.productData[index].img,
                                  price:
                                      homeProvider!.productData[index].price! *
                                          2,
                                  name: homeProvider!.productData[index].name,
                                  q: homeProvider!.productData[index].q! + 1);
                              homeProvider!.updateQa(index, p1);
                            },
                            icon: Icon(Icons.add)),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text("${homeProvider!.productData[index].q}"),
                        ),
                        IconButton(
                            onPressed: () {
                              ProductModel p1 = ProductModel(
                                  img: homeProvider!.productData[index].img,
                                  price:
                                      homeProvider!.productData[index].price! /
                                          2,
                                  name: homeProvider!.productData[index].name,
                                  q: homeProvider!.productData[index].q! - 1);
                              homeProvider!.updateQa(index, p1);
                            },
                            icon: Icon(Icons.remove)),
                      ],
                    ),
                  ),
              itemCount: homeProvider!.cartData.length),
        ),
      ),
    );
  }
}
