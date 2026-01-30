import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uiapp/Components/button.dart';
import 'package:uiapp/Components/food_tittle.dart';
import 'package:uiapp/Screens/Food_detail_Screen.dart';
import 'package:uiapp/Themes/Colors.dart';
import 'package:uiapp/models/food_model.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  // Food Menu
  List<FoodModel> foodMenu = [
    // Salmon
    FoodModel(
      name: "Salmon",
      price: "120.00",
      imagePath: "lib/images/gunkan.png",
      rating: "5.6",
    ),

    //Tuna
    FoodModel(
      name: "Tuna",
      price: "500.00",
      imagePath: "lib/images/maki.png",
      rating: "3.5",
    ),
  ];

  // Navigate to Product Detail screen:
  void navigate_To_Food_Details(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailScreen(food: foodMenu[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.menu, color: Colors.grey[900]),
        title: Column(
          children: [
            Text(
              "Karachi",
              style: TextStyle(color: Colors.grey[900], fontSize: 16),
            ),
            const Text(
              "Chinese & Sushi",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.shopping_bag_outlined, color: Colors.black),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🎏 Promo Banner
          Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(211, 47, 47, 1),
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '50% OFF Today',
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Authentic Chinese Taste',
                      style: TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 15),
                    MyButton(text: 'Order Now', onTap: () {}),
                  ],
                ),
                Image.asset('lib/images/sushi.png', height: 100),
              ],
            ),
          ),

          const SizedBox(height: 25),
          // 🔍 Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search sushi, ramen, rice...',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          const SizedBox(height: 25),

          // 🥢 Categories
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              children: const [
                _CategoryChip(text: "Sushi 🍣"),
                _CategoryChip(text: "Ramen 🍜"),
                _CategoryChip(text: "Rice 🍚"),
                _CategoryChip(text: "Seafood 🦐"),
              ],
            ),
          ),

          const SizedBox(height: 25),

          // 🍱 Menu Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Popular Dishes",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
                fontSize: 18,
              ),
            ),
          ),

          SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodMenu.length,
              itemBuilder: (context, index) => FoodTittle(
                food: foodMenu[index],
                onTap: () => navigate_To_Food_Details(index),
              ),
            ),
          ),
          SizedBox(height: 25),

          // Popular food
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    //Image
                    Image.asset('lib/images/rice.png', height: 60),

                    SizedBox(width: 20),

                    // name and Price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // name
                        Text(
                          'Rice',
                          style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                        ),
                        SizedBox(height: 10),

                        // .. price
                        Text(
                          '\$1200',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ],
                ),
                //Icon
                const Icon(
                  Icons.favorite_outline_outlined,
                  color: Colors.grey,
                  size: 28,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//🍟 class
class _CategoryChip extends StatelessWidget {
  final String text;
  const _CategoryChip({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.center,
      child: Text(text),
    );
  }
}
