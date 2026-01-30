import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uiapp/Components/button.dart';
import 'package:uiapp/Themes/Colors.dart';
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
      quantityCount--;
    });
  }

  //indecrement quantity
  void indecrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  // ADD to cart Method
  void add_To_Cart() {}

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
                  Image.asset(widget.food.imagePath, height: 200),
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

          // 💳Prices + QUANTYTTYI ETC
          Container(
            color: advanced_color,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  //💳Price + QUANTITY
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //price
                      Text(
                        "\$" + widget.food.price,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),

                      //QUANTITY
                      Row(
                        children: [
                          // minus buton
                          Container(
                            decoration: BoxDecoration(
                              color: secoundarycolor,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: decrementQuantity,
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                          ),

                          // QUANTITY button
                          SizedBox(
                            width: 40,
                            child: Center(
                              child: Text(
                                quantityCount.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),

                          //plus button
                          Container(
                            decoration: BoxDecoration(
                              color: secoundarycolor,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: indecrementQuantity,
                              icon: const Icon(Icons.add, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 25),
                  //Add to cart button
                  MyButton(text: "Add To Card", onTap: add_To_Cart),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
