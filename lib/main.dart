import 'package:flutter/material.dart';
import 'package:foodheaven/AllScreen/LoginScreen.dart';
import 'package:foodheaven/AllScreen/ProfileScreen.dart';
import 'package:foodheaven/AllScreen/RegistrationScreen.dart';

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

        
      },
    );
  }
}
