import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uiapp/Components/menu_app_bar.dart';

class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({super.key});

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
