import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uiapp/Themes/Colors.dart';
import 'package:uiapp/models/Shop_models.dart';
import 'package:uiapp/models/food_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  // remove cart function
  void remove_from_cart() {}

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopModels>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: const Text('My Cart'),
          backgroundColor: primaryColor,
        ),

        body: ListView.builder(
          itemCount: value.cart.length,
          itemBuilder: (context, index) {
            //get food from the cart
            final FoodModel food = value.cart[index];

            //gets the food name
            final String foodname = food.name;

            // get food price
            final String foodprice = food.price;

            //return nice list view
            return Container(
              decoration: BoxDecoration(gradient: primaryGradient),
              child: ListTile(
                title: Text(foodname),
                subtitle: Text(foodprice),
                trailing: IconButton(
                  onPressed: remove_from_cart,
                  icon: Icon(Icons.delete),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
