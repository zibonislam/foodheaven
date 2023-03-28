import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../AllScreen/food_detail.dart';
import '../models/food.dart';
import '../services/foodApi.dart';

late List<Food>? _foodModel = [];

class FoodScreen extends StatefulWidget {
  const FoodScreen({Key? key}) : super(key: key);

  static String idScreen = "foodScreen";

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  void getFood() async {
    _foodModel = (await FoodService().getFood())!;

    Future.delayed(const Duration(seconds: 1)).then((value) => setState(
          () {},
        ));
  }

  @override
  void initState() {
    getFood();
  }

  @override
  Widget build(BuildContext context) {
    List<ImageData> imageDataList = [
      ImageData(
        imagePath: "assets/images/foodimage1.jpeg",
        name: "Pizza",
        description: "Price : 150 ",
      ),
      ImageData(
        imagePath: "assets/images/foodimage1.jpeg",
        name: "Bargar",
        description: "Price : 250",
      ),
      ImageData(
        imagePath: "assets/images/foodimage1.jpeg",
        name: "Soup",
        description: "Price : 180",
      ),
      ImageData(
        imagePath: "assets/images/foodimage1.jpeg",
        name: "Snackes",
        description: "Price : 150",
      ),
      ImageData(
        imagePath: "assets/images/foodimage1.jpeg",
        name: "Kacchi",
        description: "Price : 150",
      ),
      ImageData(
        imagePath: "assets/images/foodimage1.jpeg",
        name: "Mutton",
        description: "Chicken ",
      ),
      ImageData(
        imagePath: "assets/images/foodimage1.jpeg",
        name: "Fride Rice",
        description: "Price : 150",
      ),
      ImageData(
        imagePath: "assets/images/foodimage1.jpeg",
        name: "Beef",
        description: "Price : 150",
      ),
      ImageData(
        imagePath: "assets/images/foodimage1.jpeg",
        name: "Teheri",
        description: "TPrice : 300",
      ),

      // add more images here...
    ];

    List<ImageData> Restaurentslist = [
      ImageData(
        imagePath: "assets/images/restaurantimage1.jpg",
        name: "Cafa Rio",
        description: "Place : Dhaka ",
      ),
      ImageData(
        imagePath: "assets/images/restaurantimage1.jpg",
        name: "Ali Baba",
        description: "Place : Dhaka",
      ),
      ImageData(
        imagePath: "assets/images/restaurantimage1.jpg",
        name: "Sultans dine",
        description: "Place : Dhaka",
      ),
      ImageData(
        imagePath: "assets/images/restaurantimage1.jpg",
        name: "Kacchi vai",
        description: "Place : Dhaka",
      ),
      ImageData(
        imagePath: "assets/images/restaurantimage1.jpg",
        name: "Kacchi",
        description: "Place : Sharaton",
      ),
      ImageData(
        imagePath: "assets/images/restaurantimage1.jpg",
        name: "Sonarga ",
        description: "Place : Dhaka ",
      ),
      ImageData(
        imagePath: "assets/images/restaurantimage1.jpg",
        name: "Redison",
        description: "Place : Dhaka",
      ),
      ImageData(
        imagePath: "assets/images/restaurantimage1.jpg",
        name: "Gulsan ",
        description: "Place : Dhaka",
      ),
      ImageData(
        imagePath: "assets/images/restaurantimage1.jpg",
        name: "Basmoti",
        description: "Place : Dhaka",
      ),

      // add more images here...
    ];

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('Food'),
        //   leading: IconButton(
        //     icon: Icon(Icons.arrow_back),
        //     onPressed: () {
        //       // Navigator.pushNamedAndRemoveUntil(
        //       //     context, HomeScreen.idScreen, (route) => false);
        //     },
        //   ),
        // ),
        body: Column(
          children: [
            Text(
              'Food Items',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(child: foodview()),
            SizedBox(
              height: 50.0,
            ),
            Text(
              'Restaurents',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: GridView(
                padding: const EdgeInsets.all(20.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.8,
                ),
                children: Restaurentslist.map((imageData) {
                  return Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.asset(
                          imageData.imagePath,
                          width: 150, // height: 120,
                        ),
                        const SizedBox(height: 8.0),
                        Text(imageData.name),
                        Text(
                          imageData.description,
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageData {
  final String imagePath;
  final String name;
  final String description;

  // Constructor for the class
  ImageData({
    required this.imagePath,
    required this.name,
    required this.description,
  });
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

Widget foodview() {
  return Container(
    child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: _foodModel!.length,
      itemBuilder: (BuildContext context, int index) {
        final item = _foodModel![index];
        return Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image(
                image: NetworkImage(_foodModel![index].image.toString()),
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
              // Image.asset(
              //   _foodModel![index].image.toString(),
              //   width: 180,
              // ),
              const SizedBox(height: 8.0),
              Text(_foodModel![index].foodName.toString()),
              Text(
                _foodModel![index].price.toString(),
                style: TextStyle(fontSize: 8),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil<dynamic>(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              FoodDetails(food: _foodModel![index])),
                      (route) => false);
                },
                child: Text("Details"),
              ),
            ],
          ),
        );
      },
    ),
  );
}
