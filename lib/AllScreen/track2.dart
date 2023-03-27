import 'package:flutter/material.dart';

class TrackingOrderPage2 extends StatelessWidget {
  final String orderStatus;

  TrackingOrderPage2({required this.orderStatus});

  static String idScreen = "track2";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track Your Order'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Order Status:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              orderStatus,
              style: TextStyle(
                fontSize: 36,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement updating the order status using an API call
              },
              child: Text(
                'Update Order Status',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
