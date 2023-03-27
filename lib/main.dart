import 'package:flutter/material.dart';
import 'package:foodheaven/AllScreen/LoginScreen.dart';
import 'package:foodheaven/AllScreen/ProfileScreen.dart';
import 'package:foodheaven/AllScreen/RegistrationScreen.dart';
import 'package:foodheaven/AllScreen/cart.dart';


import 'package:foodheaven/AllScreen/changeAddressScreen.dart';
import 'package:foodheaven/AllScreen/checkoutScreen.dart';
import 'package:foodheaven/AllScreen/food_detail.dart';

import 'package:foodheaven/AllScreen/order.dart';

import 'package:foodheaven/AllScreen/searching.dart';
import 'package:foodheaven/AllScreen/track.dart';
import 'package:foodheaven/AllScreen/track2.dart';

import 'AllScreen/homeScreen.dart';
import 'FoodRelated/FoodScreen.dart';

void main() {
  runApp(const Login());
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),

      initialRoute: HomeScreen.idScreen,

      routes: {
        RegistrationScreen.idScreen: (context) => RegistrationScreen(),
        LoginScreen.idScreen: (context) => LoginScreen(),
        ProfileScreen.idScreen: (context) => ProfileScreen(),
        FoodScreen.idScreen: (context) => FoodScreen(),
        HomeScreen.idScreen: (context) => HomeScreen(),
        Searching.idScreen: (context) => Searching(),
        CartPage.idScreen: (context) => CartPage(),
        FoodScreen.idScreen: (context) => FoodScreen(),

        OrderPage.idScreen: (context) => OrderPage(),

        ChangeAddressScreen.idScreen: (context) => ChangeAddressScreen(),
        CheckoutScreen.idScreen: (context) => CheckoutScreen(),
        FoodDetails.idScreen: (context) => FoodDetails(),
        OrderPage.idScreen: (context) => OrderPage(),
        Searching.idScreen: (context) => Searching(),
        TrackingOrderPage.idScreen: (context) => TrackingOrderPage(),
        TrackingOrderPage2.idScreen: (context) => TrackingOrderPage2(
              orderStatus: '',
            )

      },
    );
  }
}
