import 'dart:convert';

import 'package:foodheaven/constants.dart';
import 'package:foodheaven/models/cart.dart';

import 'package:http/http.dart' as http;

class OrderService {
  static Future<Cart> addToOrder(Cart cart) async {
    Map data = {
      "quantity": cart.quantity,
      "price": cart.price,
    };

    var body = json.encode(data);
    var url = Uri.parse(ApiConstants.baseUrl +
        ApiConstants.orderMidPoint +
        ApiConstants.Endpoint);
    var response =
        await http.post(url, headers: ApiConstants.headers, body: body);
    if (response.statusCode == 200) {
      // Posts post = postsFromJson(response.body) as Posts;
      Cart cart = Cart.fromJson(jsonDecode(response.body));
      print(response.body);

      return cart;
    } else {
      throw Exception('Failed to load a case');
    }

    //Map responseMap = jsonDecode(response.body);
  }
  //getData

  Future<List<Cart>?> getorder() async {
    try {
      print("API Call----------cart ");

      var url = Uri.parse(ApiConstants.baseUrl +
          ApiConstants.cartMidPoint +
          ApiConstants.Endpoint);
      var response = await http.get(url);
      print("API Call----------cart2 ");

      if (response.statusCode == 200) {
        print("API Call----------cart3 ");

        List<Cart> _cartFood = cartFromJson(response.body);
        return _cartFood;
      } else {
        print("something ");
      }
    } catch (e) {
      print(e);
    }
  }
}
