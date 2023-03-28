import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:foodheaven/models/order.dart';
import 'package:foodheaven/services/orderService.dart';

import 'homeScreen.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  static String idScreen = "order";

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  late List<Order>? _orderModel = [];

  void getOrder() async {
    _orderModel = (await OrderService().getorder())!;
    print("getData-----");
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(
          () {},
        ));
  }

  Widget orderbody() {
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
        child: _orderModel == null || _orderModel!.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _orderModel!.length,
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
                                        "https://e7.pngegg.com/pngimages/936/444/png-clipart-computer-icons-icon-design-order-icon-cdr-angle-thumbnail.png"))),
                          ),
                        ),
                        Container(
                          width: 300,
                          height: 110,
                          child: ListTile(
                            title: Padding(
                              padding: EdgeInsets.all(16),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _orderModel![index].id.toString(),
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      _orderModel![index].state.toString(),
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      _orderModel![index].totalPrice.toString(),
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOrder();
    print("init");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "My Order",
          style: TextStyle(color: Colors.black),
        ),
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
      body: orderbody(),
    ));
  }
}
