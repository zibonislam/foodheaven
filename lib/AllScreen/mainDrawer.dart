import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodheaven/AllScreen/order.dart';

import 'LoginScreen.dart';
import 'ProfileScreen.dart';

import 'homeScreen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(''),
              accountEmail: Text(''),
              currentAccountPicture: CircleAvatar(
                  //   backgroundImage: AssetImage('assets/images/profile_picture.jpg'),
                  ),
            ),
            ListTile(
              leading: Icon(Icons.account_box_sharp),
              title: Text('Profile'),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, ProfileScreen.idScreen, (route) => false);
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, HomeScreen.idScreen, (route) => false);
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Product List'),
              onTap: () {

                Navigator.pushNamedAndRemoveUntil(
                    context, OrderPage.idScreen, (route) => false);

                //  Navigator.pushNamedAndRemoveUntil(context,ProductView.idScreen, (route) =>  false);

              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Create'),
              onTap: () {

                Navigator.pushNamedAndRemoveUntil(
                    context, HomeScreen.idScreen, (route) => false);

                //   Navigator.pushNamedAndRemoveUntil(context,HomeScreen.idScreen, (route) =>  false);

              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Handle Settings click
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, LoginScreen.idScreen, (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
