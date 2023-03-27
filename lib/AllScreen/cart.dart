import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:foodheaven/AllScreen/checkoutScreen.dart';
import 'package:foodheaven/AllScreen/homeScreen.dart';
import 'package:foodheaven/AllScreen/order.dart';
import 'package:foodheaven/models/cart.dart';
import 'package:foodheaven/models/food.dart';
import 'package:foodheaven/services/foodToCart.dart';
import 'package:foodheaven/services/orderService.dart';

class CartPage extends StatefulWidget {
  static String idScreen = "/cart";

  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int _quantity = 0;
  int _totalPrice = 0;
  late List<Cart>? _cartModel = [];

  void getCart() async {
    _cartModel = (await FoodToCartService().getCart())!;
    print("getData-----");
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(
          () {},
        ));
  }

  int count = 1;
  Widget cartbody() {
    return Container(
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(20),
      //   color: Colors.white,
      //   border: Border.all(width: 1),
      // ),
      // height: 140,
      // width: double.infinity,
      child: ListTileTheme(
        iconColor: Colors.red,
        textColor: Colors.black54,
        tileColor: Colors.yellow[100],
        style: ListTileStyle.list,
        dense: true,
        child: _cartModel == null || _cartModel!.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _cartModel!.length,
                itemBuilder: (BuildContext context, int index) => Card(
                  margin: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            height: 110,
                            width: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        _cartModel![index].image.toString())
                                    // NetworkImage(
                                    //   // _foodModel![index].image.,
                                    //   _cartModel![index].image.toString(),
                                    //   // ${_foodModel![index].image}
                                    // ),
                                    )),
                          ),
                        ),
                        Container(
                          width: 300,
                          height: 110,
                          child: ListTile(
                            title: Padding(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _cartModel![index].foodName.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Text(
                                    _cartModel![index].price.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Text(
                                    _cartModel![index].quantity.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Center(child: Quantity()),
                                ],
                              ),
                            ),
                            trailing: Padding(
                              padding: EdgeInsets.all(10),
                              child: IconButton(
                                icon: Icon(Icons.delete_forever),
                                iconSize: 40,
                                color: Colors.redAccent,
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  Widget Quantity() {
    int count = 1;
    return Container(
        child: Container(
      height: 20.0,
      width: 80,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        GestureDetector(
          child: Icon(
            Icons.remove,
            size: 13,
            color: Colors.black,
          ),
          onTap: () {
            print("dddd");
            setState(() {
              count--;
            });
          },
        ),
        GestureDetector(
          child: Center(
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Text(
                count.toString(),
                //  _cartModel![index].image.toString(),
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          child: Icon(
            Icons.add,
            size: 13,
            color: Colors.black,
          ),
          onTap: () {
            setState(() {
              count++;
            });
          },
        )
      ]),
    ));
  }

  Widget totalAmount() {
    return Container(
      child: SingleChildScrollView(
        child: Row(
          children: [
            Padding(
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Subtotal",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Delivery Fee",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "PlatForm Fee",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Vat(5%)",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Discount",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Total",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                      ]),
                )),
            SizedBox(
              width: 180,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "00",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "00",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "00",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "00",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "00",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "00",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCart();
    print("init");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Container(
        child: ElevatedButton(
          onPressed: () async {
            Navigator.pushNamedAndRemoveUntil(
                context, CheckoutScreen.idScreen, (Route) => false);
            Cart carti = new Cart();
            carti.price = _totalPrice;
            // carti.quantity = count;

            var data = (await OrderService.addToOrder(carti));

            print(data);

            print(_totalPrice);
            print(count);

            // Navigator.pushNamedAndRemoveUntil(
            //     context, OrderPage.idScreen, (route) => false);
          },
          child: Text('Proced to Checkout'),
        ),
      ),
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

        //   backgroundColor: Colors.white,
        // title: const Text('cart Page'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, HomeScreen.idScreen, (Route) => false);
          },
        ),
      ),
      body: cartbody(),
      // SingleChildScrollView(
      //   child: Column(
      //     children: [cartbody(), totalAmount()],
      //   ),
      // ),
    ));
  }
}
