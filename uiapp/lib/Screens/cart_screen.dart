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

        body: SafeArea(
          bottom: true,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.dmSans(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                    children: [
                      TextSpan(
                        text:
                            '${value.cart.length} item${value.cart.length != 1 ? 's' : ''}. Total (excluding delivery) ',
                      ),
                      TextSpan(
                        text: '\$${value.getTotalPrice().toStringAsFixed(2)}',
                        style: const TextStyle(
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

                    //Get food Image
                    final String foodimagePath = food.imagePath!;

                    //return nice list view
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 18,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Product Image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              width: 100,
                              height: 100,
                              color: Colors.grey[200],
                              // Check if image exists
                              child: foodimagePath != null
                                  ? Image.asset(
                                      foodimagePath,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Container(
                                          color: Colors.grey[300],
                                          child: const Icon(
                                              Icons.image_not_supported),
                                        );
                                      },
                                    )
                                  : Container(
                                      color: Colors.grey[300],
                                      child: const Icon(Icons.fastfood),
                                    ),
                            ),
                          ),

                          const SizedBox(width: 16),

                          //Product Details
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // ?PRICE
                                  Text(
                                    '\$$foodprice',
                                    style: GoogleFonts.dmSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 4),

                                  // ??Product name
                                  Text(
                                    foodname,
                                    style: GoogleFonts.dmSans(
                                      fontSize: 14,
                                      color: Colors.black87,
                                      height: 1.3,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Delete button
                          IconButton(
                            onPressed: () => remove_from_cart(food, context),
                            icon: const Icon(
                              Icons.close,
                              color: Colors.grey,
                              size: 20,
                            ),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              //PAY BUTTON 💳💸
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: MyButton(
                  text: 'Pay Now',
                  onTap: () {
                    Navigator.pushNamed(context, '/payment_screen');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
