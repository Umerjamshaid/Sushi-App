import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uiapp/Themes/Colors.dart';

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
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Make Payment'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Fee Summary Card
            Card(
              color: surfaceColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fee Summary',
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildSummaryRow('Voucher Number', '6002004635'),
                    _buildSummaryRow('Student Name', 'Muhammad Mustafa'),
                    _buildSummaryRow('Roll No', '1109469'),
                    const Divider(color: textSecondary),
                    _buildSummaryRow(
                      'Total Amount',
                      'Rs. 3,600',
                      isTotal: true,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Payment Method Selection
            Text(
              'Select Payment Method',
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildMethodOption(
                  title: 'Credit Card',
                  icon: Icons.credit_card,
                  value: 'credit_card',
                ),
                const SizedBox(width: 12),
                _buildMethodOption(
                  title: 'Debit Card',
                  icon: Icons.credit_card,
                  value: 'debit_card',
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Card Details Form (shown if card selected)
            if (_selectedMethod.contains('card'))
              Card(
                color: cardColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _cardNumberController,
                        decoration: const InputDecoration(
                          labelText: 'Card Number',
                          hintText: '1234 5678 9012 3456',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _expiryController,
                              decoration: const InputDecoration(
                                labelText: 'MM/YY',
                                hintText: '12/24',
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextFormField(
                              controller: _cvvController,
                              decoration: const InputDecoration(
                                labelText: 'CVV',
                                hintText: '123',
                              ),
                              obscureText: true,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _cardHolderController,
                        decoration: const InputDecoration(
                          labelText: 'Cardholder Name',
                          hintText: 'John Doe',
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            const SizedBox(height: 30),

            // Pay Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement payment processing (call API)
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Processing payment...'),
                      backgroundColor: primaryColor,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Pay Now',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: isTotal ? Colors.white : textSecondary,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: isTotal ? primaryColor : Colors.white,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              fontSize: isTotal ? 18 : 14,
            ),
          ),
        ],
      ),
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
        onTap: () {
          setState(() {
            _selectedMethod = value;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? primaryColor : surfaceColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? primaryColor : textSecondary,
              width: 1.5,
            ),
          ),
          child: Column(
            children: [
              Icon(icon, color: isSelected ? Colors.black : Colors.white70),
              const SizedBox(height: 4),
              Text(
                title,
                style: TextStyle(
                  color: isSelected ? Colors.black : Colors.white70,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
