import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uiapp/models/food_model.dart';

class FoodTittle extends StatelessWidget {
  final FoodModel food;
  final void Function()? onTap;

  const FoodTittle({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 25),
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // image
              Image.asset(food.imagePath!, height: 140),

              // TExt
              Text(food.name, style: GoogleFonts.dmSerifDisplay(fontSize: 20)),

              // RAting+ rating
              SizedBox(
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Price
                    Text(
                      '\Rs.' + food.price,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),

                    //Rating
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber[700]),
                        Text(food.rating, style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
