import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../model/productModel.dart';
import '../provider/home_provider.dart';

class FruitData extends StatefulWidget {
  const FruitData({Key? key}) : super(key: key);

  @override
  State<FruitData> createState() => _FruitDataState();
}
class _FruitDataState extends State<FruitData> {
  HomeProvider? homeProvider;
  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeProvider>(context, listen: false);
    ProductModel p1 =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text("Fruit Data", style: GoogleFonts.poppins(fontSize: 18)),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back))),
        body: Center(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text("${p1.img}", style: TextStyle(fontSize: 120)),
                SizedBox(
                  height: 10,
                ),
                Text("${p1.name}",
                    style: GoogleFonts.poppins(
                        fontSize: 28, fontWeight: FontWeight.w800)),
                SizedBox(
                  height: 10,
                ),
                Text("${p1.price}",
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      print(p1.name);
                      homeProvider!.addcart(p1);
                      Navigator.pop(context);

                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange.shade500),
                    child: Text(
                      "ADD TO CART",
                      style: GoogleFonts.poppins(
                          fontSize: 18, color: Colors.white),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
