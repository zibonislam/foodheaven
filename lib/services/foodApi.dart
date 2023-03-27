import 'dart:math';

import 'package:foodheaven/constants.dart';

import '../models/food.dart';
import 'package:http/http.dart ' as http;

class FoodService {
  Future<List<Food>?> getFood() async {
    try {
      print("API Call---------- ");

      var url = Uri.parse(ApiConstants.baseUrl2);
      http.Response response = await http.get(url);
      print("API Call----------2 ");

      if (response.statusCode == 200) {
        print("API Call----------3 ");

        List<Food> _modelFood = foodFromJson(response.body);
        return _modelFood;
      } else {
        print("something ");
      }
    } catch (e) {
      print(e);
    }
  }
}
