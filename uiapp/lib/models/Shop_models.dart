import 'package:flutter/widgets.dart';
import 'package:uiapp/models/food_model.dart';

class ShopModels extends ChangeNotifier {
  // Food Menu
  final List<FoodModel> _foodMenu = [
    // Salmon
    FoodModel(
      name: "Salmon",
      price: "120.00",
      imagePath: "lib/images/gunkan.png",
      rating: "5.6",
      cacategory: "Freash",
    ),

    //Tuna
    FoodModel(
      name: "Tuna",
      price: "500.00",
      imagePath: "lib/images/maki.png",
      rating: "3.5",
      cacategory: "Tasty",
    ),
  ];

  List<FoodModel> _cart = [];

  // Getter Methods - So we can accses them from around the code
  List<FoodModel> get foodMenu => _foodMenu;
  List<FoodModel> get cart => _cart;

  // Add To Cart Method
  void add_to_cart(FoodModel fooditem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(fooditem);
    }
    notifyListeners();
  }

  // And Remove From Cart Method
  void removefromthecart(FoodModel food) {
    _cart.remove(food);
    notifyListeners();
  }

  // // In your Shop_models.dart
  // double getTotalPrice() {
  //   double total = 0;
  //   for (var item in cart) {
  //     total += double.tryParse(item.price) ?? 0;
  //   }
  //   notifyListeners();
  //   return total;
  // }
}
