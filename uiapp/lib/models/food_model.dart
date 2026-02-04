import 'package:flutter/widgets.dart';

class FoodModel {
  String name;
  String price;
  String? imagePath;
  String rating;
  String? cacategory; // I can work on this latter :)

  FoodModel({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.rating,
    this.cacategory,
  });

  String get _name => name;
  String get _price => price;
  String get _imagePath => imagePath!;
  String get _rating => rating;
  String get _category => cacategory!;
}
