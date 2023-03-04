import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../model/productModel.dart';
import '../provider/home_provider.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  Color c1 = Color(0xff2874F0);
  Color c2 = Color(0xffFB641B);
  HomeProvider? homeProvider;

  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          "🛍 Flipkart",
          style: GoogleFonts.poppins(fontSize: 18, letterSpacing: 1),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'cart');
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.orangeAccent,
              )),
        ],
      ),
      body: GridView.builder(
        itemCount: homeProvider!.productData.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            ProductModel p1 = ProductModel(
                name: homeProvider!.productData[index].name,
                img: homeProvider!.productData[index].img,
                price: homeProvider!.productData[index].price);
            Navigator.pushNamed(context, 'fruitdata', arguments: p1);
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(13),
            decoration: BoxDecoration(
                color: Colors.green.shade300,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("${homeProvider!.productData[index].img}",
                    style:
                        TextStyle(fontSize: 90, color: Colors.orange.shade700)),
                Text("${homeProvider!.productData[index].name}",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    )),
                Text("${homeProvider!.productData[index].price}",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    )),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
