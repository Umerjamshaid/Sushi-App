import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uiapp/Components/button.dart';
import 'package:uiapp/Themes/Colors.dart';
import 'package:uiapp/models/Shop_models.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _cardNumberController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvvController = TextEditingController();
  final _cardHolderController = TextEditingController();
  String _selectedMethod = 'credit_card';

  @override
  Widget build(BuildContext context) {
    // 1. Using Provider to get the shop data
    // context.watch listens for changes. If the cart changes, this widget rebuilds.
    final shop = context.watch<ShopModels>();
    final totalAmount = shop.getTotalPrice();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset('lib/images/icons_svg/arrow_left_long.svg'),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'PAYMENT',
          style: GoogleFonts.dmSans(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Colors.black,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Payment Summary Card
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Items',
                        style: GoogleFonts.dmSans(color: Colors.grey[600]),
                      ),
                      Text(
                        '${shop.cart.length}',
                        style: GoogleFonts.dmSans(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Order Total',
                        style: GoogleFonts.dmSans(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$${totalAmount.toStringAsFixed(2)}',
                        style: GoogleFonts.dmSans(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Payment Method Selection
            Text(
              'Select Payment Method',
              style: GoogleFonts.dmSans(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                _buildMethodOption(
                  title: 'Credit Card',
                  icon: Icons.credit_card,
                  value: 'credit_card',
                ),
                const SizedBox(width: 15),
                _buildMethodOption(
                  title: 'Apple Pay',
                  icon: Icons.apple,
                  value: 'apple_pay',
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Card Details Form
            if (_selectedMethod == 'credit_card') ...[
              Text(
                'Card Details',
                style: GoogleFonts.dmSans(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              _buildTextField(
                controller: _cardHolderController,
                label: 'Cardholder Name',
                hint: 'John Doe',
              ),
              const SizedBox(height: 15),
              _buildTextField(
                controller: _cardNumberController,
                label: 'Card Number',
                hint: '1234 5678 9012 3456',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _expiryController,
                      label: 'Expiry',
                      hint: 'MM/YY',
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: _buildTextField(
                      controller: _cvvController,
                      label: 'CVV',
                      hint: '123',
                      obscureText: true,
                    ),
                  ),
                ],
              ),
            ],

            const SizedBox(height: 40),

            // Pay Button
            MyButton(
              text: 'Confirm Payment',
              onTap: () {
                // Handle payment processing
                _showSuccessDialog();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.dmSans(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMethodOption({
    required String title,
    required IconData icon,
    required String value,
  }) {
    final isSelected = _selectedMethod == value;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedMethod = value),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            color: isSelected ? primaryColor : Colors.grey[100],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.white : Colors.grey[600],
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: GoogleFonts.dmSans(
                  color: isSelected ? Colors.white : Colors.grey[600],
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Payment Successful'),
        content: const Text('Your order has been placed successfully!'),
        actions: [
          TextButton(
            onPressed: () {
              // Clear cart after payment
              context.read<ShopModels>().clearCart();
              Navigator.pop(context); // close dialog
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/menu_screen',
                (route) => false,
              );
            },
            child: const Text('Back to Menu',
                style: TextStyle(color: primaryColor)),
          ),
        ],
      ),
    );
  }
}
