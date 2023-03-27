import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodheaven/AllScreen/cart.dart';
import 'package:foodheaven/AllScreen/mainDrawer.dart';
import 'package:foodheaven/AllScreen/searching.dart';

import '../FoodRelated/FoodScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String idScreen = "home";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 173, 2, 33),
          title: Column(
            children: [
              Center(
                child: Image(
                  image: NetworkImage(
                      "https://media.licdn.com/dms/image/C5622AQHck53gmEkYhQ/feedshare-shrink_1280/0/1679069156443?e=1681948800&v=beta&t=72WDFfc7qCNRsGNjGMdMA4zgxXoOjY-0gmJD24TK878"),
                  width: 300.0,
                  height: 500.0,
                ),
              )
            ],
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, Searching.idScreen, (route) => false);
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart_rounded),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, CartPage.idScreen, (route) => false);
              },
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: SafeArea(child: FoodScreen()),
      ),
    );
  }
}
