import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uiapp/Components/button.dart';
import 'package:uiapp/Themes/Colors.dart';
import 'package:uiapp/models/Shop_models.dart';
import 'package:uiapp/models/food_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  // remove cart function
  void remove_from_cart(FoodModel food, BuildContext context) {
    // Get Accese to the Shop
    final shop = context.read<ShopModels>();

    //Remove FRom Cart
    shop.removefromthecart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopModels>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: SvgPicture.asset('lib/images/icons_svg/arrow_left_long.svg'),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'MY CART',
            style: GoogleFonts.dmSans(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Colors.black,
              letterSpacing: 1.2,
            ),
          ),
          centerTitle: true,
        ),

        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: RichText(
                text: TextSpan(
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                  children: [
                    TextSpan(text: '1 item. Total (excluding delivery)'),
                    TextSpan(
                      text: '\$348.99',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //🛒🛒 CUSTOM CART
            Expanded(
              child: ListView.builder(
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
                    decoration: BoxDecoration(
                      gradient: primaryGradient,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: ListTile(
                      title: Text(
                        foodname,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        foodprice,
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () => remove_from_cart(food, context),
                        icon: Icon(Icons.delete, color: Colors.grey[300]),
                      ),
                    ),
                  );
                },
              ),
            ),

            //PAY BUTTON 💳💸
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: MyButton(text: 'Pay Now', onTap: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
