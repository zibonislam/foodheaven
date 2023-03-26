// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

List<Cart> cartFromJson(String str) =>
    List<Cart>.from(json.decode(str).map((x) => Cart.fromJson(x)));

String cartToJson(List<Cart> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cart {
  Cart({
    this.id,
    this.foodCode,
    this.foodName,
    this.orgin,
    this.restaurant,
    this.price,
    this.quantity,
    this.category,
    this.image,
    this.foodDescription,
    this.discount,
    this.userId,
    this.foodId,
  });

  int? id;
  String? foodCode;
  String? foodName;
  String? orgin;
  dynamic restaurant;
  int? price;
  int? quantity;
  dynamic category;
  String? image;
  String? foodDescription;
  int? discount;
  int? userId;
  int? foodId;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"],
        foodCode: json["food_code"],
        foodName: json["food_name"],
        orgin: json["orgin"],
        restaurant: json["restaurant"],
        price: json["price"],
        quantity: json["quantity"],
        category: json["category"],
        image: json["image"],
        foodDescription: json["food_description"],
        discount: json["discount"],
        userId: json["userId"],
        foodId: json["foodId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "food_code": foodCode,
        "food_name": foodName,
        "orgin": orgin,
        "restaurant": restaurant,
        "price": price,
        "quantity": quantity,
        "category": category,
        "image": image,
        "food_description": foodDescription,
        "discount": discount,
        "userId": userId,
        "foodId": foodId,
      };
}
