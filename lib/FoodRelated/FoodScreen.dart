import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({Key? key}) : super(key: key);

  static String idScreen = "foodScreen";

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
        appBar: AppBar(
          title: Text('Food'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Navigator.pushNamedAndRemoveUntil(
              //     context, HomeScreen.idScreen, (route) => false);
            },
          ),
        ),
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

            Expanded(
              child: GridView(
                padding: const EdgeInsets.all(20.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.8,
                ),
                children: imageDataList.map((imageData) {
                  return Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.asset(
                          imageData.imagePath,
                          width: 180,
                        ),
                        const SizedBox(height: 8.0),
                        Text(imageData.name),
                        Text(
                          imageData.description,
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
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
                          width: 150,// height: 120,
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

class HomeScreen {
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