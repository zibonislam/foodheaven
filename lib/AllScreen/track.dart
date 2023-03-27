import 'package:flutter/material.dart';

class TrackingOrderPage extends StatefulWidget {
  static String idScreen = "track";

  @override
  _TrackingOrderPageState createState() => _TrackingOrderPageState();
}

class _TrackingOrderPageState extends State<TrackingOrderPage> {
  String _orderStatus = 'Preparing';

  // this function could be replaced with API call to update order status
  void _updateOrderStatus() {
    setState(() {
      if (_orderStatus == 'Preparing') {
        _orderStatus = 'On the way';
      } else if (_orderStatus == 'On the way') {
        _orderStatus = 'Delivered';
      }
    });
  }

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
              _orderStatus,
              style: TextStyle(
                fontSize: 36,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateOrderStatus,
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
