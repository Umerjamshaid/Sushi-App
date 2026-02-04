import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uiapp/Components/button.dart';
import 'package:uiapp/Themes/Colors.dart';
import 'package:uiapp/models/Shop_models.dart';
import 'package:uiapp/models/food_model.dart';

class FoodDetailScreen extends StatefulWidget {
  final FoodModel food;
  const FoodDetailScreen({super.key, required this.food});

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  //decrement_Quantity_funtions
  int quantityCount = 0;

  //decrement quantity
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  //indecrement quantity
  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  // ADD to cart Method
  void add_To_Cart() {
    // Add to cart, Only when there is if there is somthing in the cart
    if (quantityCount > 0) {
      //Get Accses to the Shop
      final shop = context.read<ShopModels>();

      //Add to Cart
      shop.add_to_cart(widget.food, quantityCount);

      //Let the user know it was Succses
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: surfaceColor,
          content: Text(
            'Succsesfully Added To Cart',
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          actions: [
            // okay button
            IconButton(
              onPressed: () {
                // Pop Once to show remove dialog box
                Navigator.pop(context);

                //pop again to go to prevoiouse Screen\
                Navigator.pop(context);
              },
              icon: const Icon(Icons.done),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Column(
        children: [
          // Listveiw of the Food Details ETC
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  // image
                  Image.asset(widget.food.imagePath!, height: 200),
                  const SizedBox(height: 25),

                  // rating
                  Row(
                    children: [
                      // Start icon
                      Icon(Icons.star, color: Colors.amber),

                      const SizedBox(width: 5),
                      // RAting number
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),

                  // food name
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                  ),
                  const SizedBox(height: 25),
                  // foood Discriptions
                  Text(
                    "Discription",
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),

                  Text(
                    'Made with carefully selected fresh ingredients, this food offers a delicate taste and rich flavor. Each serving is crafted to ensure quality, freshness, and a delightful experience you’ll want to enjoy again.',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 💳 Bottom Price & Quantity Section
          Container(
            decoration: BoxDecoration(
              color: surfaceColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 20,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  // Price & Quantity Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // 💰 Price Section
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Price',
                            style: TextStyle(
                              color: textSecondary,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "\$${widget.food.price}",
                            style: GoogleFonts.dmSerifDisplay(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),

                      // 🔢 Quantity Selector
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            // Minus Button
                            GestureDetector(
                              onTap: quantityCount > 0
                                  ? decrementQuantity
                                  : null,
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: quantityCount > 0
                                      ? primaryColor
                                      : textHint,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),

                            // Quantity Display
                            Container(
                              width: 50,
                              alignment: Alignment.center,
                              child: Text(
                                quantityCount.toString(),
                                style: TextStyle(
                                  color: textPrimary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),

                            // Plus Button
                            GestureDetector(
                              onTap: incrementQuantity,
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  // Add to Cart Button
                  MyButton(
                    text: quantityCount > 0
                        ? "Add $quantityCount to Cart"
                        : "Add to Cart",
                    onTap: add_To_Cart,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
