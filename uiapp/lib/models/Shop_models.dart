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
  final List<FoodModel> _favorites = [];

  // Getter Methods - So we can accses them from around the code
  List<FoodModel> get foodMenu => _foodMenu;
  List<FoodModel> get cart => _cart;
  List<FoodModel> get favorites => _favorites;

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

  // Clear Cart Method
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  // Toggle Favorite
  void toggleFavorite(FoodModel food) {
    if (_favorites.contains(food)) {
      _favorites.remove(food);
    } else {
      _favorites.add(food);
    }
    notifyListeners();
  }

  // Check if Favorite
  bool isFavorite(FoodModel food) {
    return _favorites.contains(food);
  }

  // Calculate total price
  double getTotalPrice() {
    double total = 0;
    for (var item in cart) {
      total += double.tryParse(item.price) ?? 0;
    }
    return total;
  }
}
