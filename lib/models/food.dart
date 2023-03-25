// To parse this JSON data, do
//
//     final food = foodFromJson(jsonString);

import 'dart:convert';

List<Food> foodFromJson(String str) =>
    List<Food>.from(json.decode(str).map((x) => Food.fromJson(x)));

String foodToJson(List<Food> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Food {
  Food({
    this.id,
    this.foodCode,
    this.foodName,
    this.orgin,
    this.restaurant,
    this.price,
    this.category,
    this.image,
    this.foodDescription,
    this.discount,
  });

  int? id;
  String? foodCode;
  String? foodName;
  String? orgin;
  String? restaurant;
  int? price;
  String? category;
  String? image;
  String? foodDescription;
  int? discount;

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        id: json["id"],
        foodCode: json["food_code"],
        foodName: json["food_name"],
        orgin: json["orgin"],
        restaurant: json["restaurant"],
        price: json["price"],
        category: json["category"],
        image: json["image"],
        foodDescription: json["food_description"],
        discount: json["discount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "food_code": foodCode,
        "food_name": foodName,
        "orgin": orgin,
        "restaurant": restaurant,
        "price": price,
        "category": category,
        "image": image,
        "food_description": foodDescription,
        "discount": discount,
      };
}
