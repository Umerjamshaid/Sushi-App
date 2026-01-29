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
      MaterialPageRoute(builder: (context) => FoodDetailScreen()),
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
        title: Text('Karachi', style: TextStyle(color: Colors.grey[900])),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Promo banner
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Get 50% Pormo ',
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    //redeem it
                    MyButton(text: 'Redeem IT ', onTap: () {}),
                  ],
                ),
                // image
                Image.asset('lib/images/sushi.png', height: 100),
              ],
            ),
          ),

          const SizedBox(height: 25),
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'Search here...',
              ),
            ),
          ),

          const SizedBox(height: 25),
          //Menu List
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Food Menu",
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
