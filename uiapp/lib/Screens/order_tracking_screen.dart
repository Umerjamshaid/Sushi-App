import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uiapp/Themes/Colors.dart';

class OrderTrackingScreen extends StatefulWidget {
  const OrderTrackingScreen({super.key});

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName('/menu_screen'));
          },
        ),
        title: Text(
          'Track Order',
          style: GoogleFonts.dmSans(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Map Placeholder (You'd typically use Google Maps here)
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(25),
                image: const DecorationImage(
                  image: AssetImage('lib/images/sushi.png'), // Placeholder
                  fit: BoxFit.cover,
                  opacity: 0.2,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on, size: 50, color: primaryColor),
                    Text(
                      'Map View',
                      style: GoogleFonts.dmSans(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            Text(
              'Delivery Status',
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            const SizedBox(height: 20),

            // Timeline
            Expanded(
              child: ListView(
                children: [
                  _buildTimelineTile(
                    title: 'Order Placed',
                    subtitle: 'We have received your order',
                    isActive: true,
                    isFirst: true,
                  ),
                  _buildTimelineTile(
                    title: 'Order Confirmed',
                    subtitle: 'Your order has been confirmed',
                    isActive: true,
                  ),
                  _buildTimelineTile(
                    title: 'Order Prepared',
                    subtitle: 'We are preparing your food',
                    isActive: true,
                  ),
                  _buildTimelineTile(
                    title: 'On the Way',
                    subtitle: 'Our delivery partner is on the way',
                    isActive: false,
                  ),
                   _buildTimelineTile(
                    title: 'Delivered',
                    subtitle: 'Enjoy your meal!',
                    isActive: false,
                    isLast: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineTile({
    required String title,
    required String subtitle,
    required bool isActive,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return SizedBox(
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline Line & Dot
          Column(
            children: [
              if (!isFirst)
                Expanded(
                  child: Container(
                    width: 2,
                    color: isActive ? primaryColor : Colors.grey[300],
                  ),
                )
              else
                const Spacer(),
              
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  color: isActive ? primaryColor : Colors.grey[300],
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 3,
                  ),
                  boxShadow: [
                     BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                    ),
                  ],
                ),
              ),

              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: isActive ? primaryColor : Colors.grey[300],
                  ),
                )
              else
                const Spacer(),
            ],
          ),

          const SizedBox(width: 20),

          // Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: isActive ? Colors.black : Colors.grey,
                  ),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.dmSans(
                    color: Colors.grey[500],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
