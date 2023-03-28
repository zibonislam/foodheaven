import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:foodheaven/AllScreen/homeScreen.dart';
import 'package:foodheaven/services/foodApi.dart';

import '../models/food.dart';
import 'food_detail.dart';

// class Serching extends StatelessWidget {
//   static String idScreen = "serching";
//   const Serching({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Column(
//           children: <Widget>[
//             serchingPageTitle(),
//             searchingTabBar(),
//           ],
//         ),
//       ),
//     );
//   }
// }

late List<Food>? _foodModel = [];

// void getFood() async {
//   _foodModel = (await FoodService().getFood())!;
//   print("getData-----");
//   Future.delayed(const Duration(seconds: 1)).then((value) => setState(
//         () {},
//       ));
// }

class Searching extends StatefulWidget {
  const Searching({super.key});

  static String idScreen = "searching";

  @override
  State<Searching> createState() => _SearchingState();
}

class _SearchingState extends State<Searching> {
//late List<Food>? _foodModel = [];

  void getFood() async {
    _foodModel = (await FoodService().getFood())!;
    print("getData-----");
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(
          () {},
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFood();
    print("init");
  }

  @override
  Widget build(BuildContext context) {
    return searchingTabBar();
    // Scaffold(
    //   body: GridView.count(
    //     primary: false,
    //     padding: const EdgeInsets.all(20),
    //     crossAxisSpacing: 10,
    //     mainAxisSpacing: 10,
    //     crossAxisCount: 2,
    //     children: <Widget>[
    //       serchingPageTitle(),
    //       searchingTabBar(),
    //     ],
    //   ),
    // );
  }

  // Widget serchingPageTitle() {
  //   return SafeArea(
  //     child: Scaffold(
  //       appBar: AppBar(),
  //       body: Padding(
  //         padding: EdgeInsets.all(12.0),
  //         child: Column(
  //           children: [
  //             Padding(
  //               padding: EdgeInsets.all(20.0),
  //               child: Row(
  //                 children: [
  //                   Expanded(
  //                     child: TextField(
  //                       keyboardType: TextInputType.text,
  //                       decoration: InputDecoration(
  //                           hintText: "Search for Restaurants & Foods",
  //                           hintStyle: TextStyle(
  //                             color: Colors.black87,
  //                             fontWeight: FontWeight.bold,
  //                             fontSize: 14.0,
  //                           )),
  //                     ),
  //                   ),
  //                   Expanded(
  //                       child: IconButton(
  //                           onPressed: () {}, icon: Icon(Icons.search_rounded)))
  //                 ],
  //               ),
  //             ),
  //             Row(
  //               children: [],
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget searchingTabBar() {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 173, 2, 33),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, HomeScreen.idScreen, (route) => false);
                },
              ),
              title: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  hintText: "Search for Restaurants & Foods",
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  )),
                            ),
                          ),
                          Expanded(
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.search_rounded)))
                        ],
                      ),
                    ),
                    Row(
                      children: [],
                    )
                  ],
                ),
              ),
              bottom: const TabBar(tabs: [Text("Food"), Text("Restaurant")])),
          body: TabBarView(
            children: [foodApp(), restaurentApp()],
          ),
        ),
      ),
    );
  }
}

Widget foodApp() {
  return Container(
    child: ListTileTheme(
      contentPadding: const EdgeInsets.all(10),
      iconColor: Colors.red,
      textColor: Colors.black54,
      tileColor: Colors.yellow[100],
      style: ListTileStyle.list,
      dense: true,
      child: _foodModel == null || _foodModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _foodModel!.length,
              itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      // _foodModel![index].image.,
                      _foodModel![index].image.toString(),
                      // ${_foodModel![index].image}
                    ),
                  ),
                  title: Text(_foodModel![index].foodName.toString()),
                  subtitle: Text(_foodModel![index].price.toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil<dynamic>(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        FoodDetails(food: _foodModel![index])),
                                (route) => false);
                          },
                          icon: const Icon(Icons.arrow_back_ios_sharp)),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.add_shopping_cart_rounded))
                    ],
                  ),
                ),
              ),
            ),
    ),
  );
}

Widget restaurentApp() {
  return Container(
    child: ListTileTheme(
      contentPadding: const EdgeInsets.all(15),
      iconColor: Colors.red,
      textColor: Colors.black54,
      tileColor: Colors.yellow[600],
      style: ListTileStyle.list,
      dense: true,
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) => Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://domf5oio6qrcr.cloudfront.net/medialibrary/3440/conversions/w0714a16207251033667-thumb.jpg"),
            ),
            title: Text('title'),
            subtitle: Text('subtitle'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back_ios_sharp)),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
