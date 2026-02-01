import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uiapp/Components/button.dart';
import 'package:uiapp/Components/category_chips.dart';
import 'package:uiapp/Components/food_tittle.dart';
import 'package:uiapp/Components/menu_app_bar.dart';
import 'package:uiapp/Components/search_bar_widget.dart';
import 'package:uiapp/Screens/Food_detail_Screen.dart';
import 'package:uiapp/Themes/Colors.dart';
import 'package:uiapp/models/Shop_models.dart';
import 'package:uiapp/models/food_model.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  // Selected category state
  String selectedCategory = "Sushi 🍣";

  // Navigate to Product Detail screen:
  void navigate_To_Food_Details(int index) {
    //Get the shop And the menu
    final shop = context.read<ShopModels>();
    final foodMenu = shop.foodMenu;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailScreen(food: foodMenu[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Get the shop And the menu
    final shop = context.read<ShopModels>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: MenuAppBar(
        location: 'Karachi',
        subtitle: "Chinese & Sushi",
        onMenuTap: () {},
        onCartTap: () {
          Navigator.pushNamed(context, '/cart_screen');
        },
        onLocationTap: () {},
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
          SearchBarWidget(),

          const SizedBox(height: 25),

          // 🥢 Categories
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              children: [
                CategoryChip(
                  text: "Sushi 🍣",
                  isSelected: selectedCategory == "Sushi 🍣",
                  onTap: () => setState(() => selectedCategory = "Sushi 🍣"),
                ),
                CategoryChip(
                  text: "Ramen 🍜",
                  isSelected: selectedCategory == "Ramen 🍜",
                  onTap: () => setState(() => selectedCategory = "Ramen 🍜"),
                ),
                CategoryChip(
                  text: "Rice 🍚",
                  isSelected: selectedCategory == "Rice 🍚",
                  onTap: () => setState(() => selectedCategory = "Rice 🍚"),
                ),
                CategoryChip(
                  text: "Seafood 🦐",
                  isSelected: selectedCategory == "Seafood 🦐",
                  onTap: () => setState(() => selectedCategory = "Seafood 🦐"),
                ),
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
