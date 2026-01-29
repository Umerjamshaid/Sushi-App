import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uiapp/Components/button.dart';
import 'package:uiapp/Themes/Colors.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Shop Name
              Text(
                'SUSHI MAN',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 25),
              // Icon
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Image.asset('lib/images/salmon_egg.png'),
              ),

              SizedBox(height: 25),

              // title
              Text(
                'THE TASTE OF JAPANESE FOOD',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 44,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),

              // Subtitle
              Text(
                'Feel The Taste Of The Most Poplar JAPANES FOOD From Anywhere',
                style: TextStyle(color: Colors.grey[300], height: 2),
              ),
              const SizedBox(height: 25),

              //Get Started Button
              MyButton(
                text: 'Get Started',
                onTap: () {
                  // Go to Mnue Page
                  Navigator.pushNamed(context, '/menu_screen');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
