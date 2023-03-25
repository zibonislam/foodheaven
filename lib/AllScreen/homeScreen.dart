

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
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
        title: Text(' Home Page'),
        centerTitle: true,
          actions: [
    IconButton(
      icon: Icon(Icons.search),
      onPressed: () {
       Navigator.pushNamedAndRemoveUntil(context,Searching.idScreen, (route) =>  false);
      },
    ),
    IconButton(
      icon: Icon(Icons.shopping_cart_rounded),
      onPressed: () {
        // do something
      },
    ),
   
  ],
      ),
      drawer:MainDrawer() ,
      
      body: SafeArea(
        child: FoodScreen()
           ),
      ),
    );
    
  }
}



