import 'dart:convert';

import 'package:foodheaven/constants.dart';
import 'package:foodheaven/models/cart.dart';
import 'package:foodheaven/models/food.dart';
import 'package:http/http.dart' as http;

class FoodToCartService {
  static Future<Food> addToCart(Food food) async {
    Map data = {
      "image": food.image,
      "quantity": food.quantity,
      "foodName": food.foodName,
      "prict": food.price,
      "restaurant": food.restaurant
    };

    var body = json.encode(data);
    var url = Uri.parse(ApiConstants.baseUrl +
        ApiConstants.cartMidPoint +
        ApiConstants.Endpoint);
    http.Response response =
        await http.post(url, headers: ApiConstants.headers, body: body);
    if (response.statusCode == 200) {
      // Posts post = postsFromJson(response.body) as Posts;
      Food fds = Food.fromJson(jsonDecode(response.body));
      print(response.body);

      return fds;
    } else {
      throw Exception('Failed to load a case');
    }

    //Map responseMap = jsonDecode(response.body);
  }
  //getData

  Future<List<Cart>?> getCart() async {
    try {
      print("API Call----------cart ");

      var url = Uri.parse(ApiConstants.baseUrl +
          ApiConstants.cartMidPoint +
          ApiConstants.Endpoint);
      http.Response response = await http.get(url);
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
