// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

List<Order> orderFromJson(String str) =>
    List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

String orderToJson(List<Order> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Order {
  Order({
    this.id,
    this.email,
    this.address,
    this.contact,
    this.state,
    this.totalPrice,
    this.userId,
  });

  int? id;
  String? email;
  String? address;
  dynamic contact;
  String? state;
  int? totalPrice;
  int? userId;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        email: json["email"],
        address: json["address"],
        contact: json["contact"],
        state: json["state"],
        totalPrice: json["totalPrice"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "address": address,
        "contact": contact,
        "state": state,
        "totalPrice": totalPrice,
        "userId": userId,
      };
}
