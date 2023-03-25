import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:foodheaven/models/food.dart';

class FoodDetails extends StatefulWidget {
  static String idScreen = "food";
  final Food? food;
  const FoodDetails({super.key, this.food});

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  int count = 1;
  Widget background() {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Container(
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Add to Cart'),
        ),
      ),
      backgroundColor: Color.fromARGB(246, 241, 230, 228),
      appBar: AppBar(backgroundColor: Colors.white),
      body: SingleChildScrollView(
        child: Column(
          children: [
            foodImage(),
            foodDetails(),
          ],
        ),
      ),
    ));
  }

  Widget foodImage() {
    return Container(
      height: 250,
      child: Stack(
        children: [
          Column(children: [
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  color: Colors.white,
                ),
              ),
            ),
          ]),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.all(15),
              width: 250,
              height: 250,
              decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  offset: Offset(-1, 10),
                  blurRadius: 10,
                )
              ]),
              child: Image(
                image:
                    // Image.asset(
                    //   "assets/images/pizza.png",
                    //   fit: BoxFit.cover,
                    // ),
                    NetworkImage(
                  "https://lattubiryani.com/wp-content/uploads/2021/09/699x699.png",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget foodDetails() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Column(
        children: [
          Text(
            widget.food!.foodName.toString(),
            // "Food Name",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            widget.food!.foodDescription.toString(),
            //"Food description",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            widget.food!.restaurant.toString(),
            // "Restaurant Name:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildIconText(Icons.access_time_outlined, Colors.blue, "50 min"),
              _buildIconText(Icons.star_outlined, Colors.amber, "4.0"),
              _buildIconText(
                  Icons.local_fire_department_outlined, Colors.red, "325kpcs"),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          foodQuantity(),
          SizedBox(
            height: 105,
          ),
          // FloatingActionButton.extended(
          //   backgroundColor: Color.fromARGB(246, 241, 230, 228),
          //   foregroundColor: Colors.black,

          //   //mini: true,
          //   tooltip: "Add to Cart",
          //   icon: Icon(Icons.add_shopping_cart_rounded),

          //   onPressed: () {
          //     // Respond to button press
          //   },
          //   label: Text("Add to Cart"),
          //   //Icon(Icons.add_shopping_cart_rounded),
          // )
        ],
      ),
    );
  }

  Widget _buildIconText(IconData icon, Color color, String text) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
          size: 20,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 16),
        )
      ],
    );
  }

  Widget foodQuantity() {
    return Container(
      width: double.maxFinite,
      height: 40,
      child: Stack(children: [
        Align(
          alignment: Alignment(-0.3, 0),
          child: Container(
            width: 120,
            height: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(30),
            ),
            // child: Row(children: [
            //   SizedBox(
            //     width: 30,
            //   ),
            // ]
            // ),
          ),
        ),
        Align(
          alignment: Alignment(
            0.3,
            0,
          ),
          child: Container(
            height: double.maxFinite,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Icon(Icons.remove),
                  onTap: () {
                    setState(() {
                      count--;
                    });
                  },
                ),
                GestureDetector(
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Text(
                        count.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  child: Icon(Icons.add),
                  onTap: () {
                    setState(() {
                      count++;
                    });
                  },
                ),

                // SizedBox(
                //   width: 25,
                // ),
                // Expanded(
                //   child: SizedBox(
                //     width: 25,
                //     child: Text(
                //       "-",
                //       style: TextStyle(
                //         fontSize: 20,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ),
                // ),
                // Expanded(
                //   child: Center(
                //     child: Container(
                //       padding: EdgeInsets.all(8),
                //       decoration: BoxDecoration(
                //         shape: BoxShape.circle,
                //         color: Colors.white,
                //       ),
                //       child: Text(
                //         "0",
                //         style: TextStyle(
                //           fontSize: 20,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   width: 20,
                // ),
                // Expanded(
                //   child: Text(
                //     "+",
                //     style: TextStyle(
                //       fontSize: 20,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Widget bottom() {
    return Container(
      height: 150,
      child: Stack(children: [
        Column(children: [
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                color: Colors.white,
              ),
            ),
          ),
        ]),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return background();
  }
}
