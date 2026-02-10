import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uiapp/models/payments_models.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Amount
            _AmountField(),
            SizedBox(height: 20),

            // Card Number
            _CardNumberField(),
            SizedBox(height: 16),

            // Card Holder
            _CardHolderField(),
            SizedBox(height: 16),

            // Expiry & CVV Row
            Row(
              children: [
                Expanded(child: _ExpiryField()),
                SizedBox(width: 16),
                Expanded(child: _CvvField()),
              ],
            ),
            SizedBox(height: 30),

            // Pay Button
            _PayButton(),
            SizedBox(height: 20),

            // Status
            _StatusMessage(),
          ],
        ),
      ),
    );
  }
}

// Amount Input
class _AmountField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Amount',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            prefixText: '\$ ',
            border: OutlineInputBorder(),
            hintText: '0.00',
          ),
          onChanged: context.read<PaymentModel>().setAmount,
        ),
      ],
    );
  }
}

// Card Number
class _CardNumberField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Only rebuilds when cardNumber changes
    final error = context.select<PaymentModel, String?>(
      (p) => p.cardNumber.isNotEmpty && p.cardNumber.length != 16
          ? '16 digits required'
          : null,
    );

    return TextField(
      keyboardType: TextInputType.number,
      maxLength: 16,
      decoration: InputDecoration(
        labelText: 'Card Number',
        hintText: '1234567890123456',
        border: OutlineInputBorder(),
        counterText: '',
        errorText: error,
      ),
      onChanged: context.read<PaymentModel>().setCardNumber,
    );
  }
}

// Card Holder
class _CardHolderField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        labelText: 'Card Holder',
        hintText: 'JOHN DOE',
        border: OutlineInputBorder(),
      ),
      onChanged: context.read<PaymentModel>().setCardHolder,
    );
  }
}

// Expiry Date
class _ExpiryField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      maxLength: 5,
      decoration: InputDecoration(
        labelText: 'Expiry',
        hintText: 'MM/YY',
        border: OutlineInputBorder(),
        counterText: '',
      ),
      onChanged: context.read<PaymentModel>().setExpiry,
    );
  }
}

// CVV
class _CvvField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      maxLength: 3,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'CVV',
        hintText: '123',
        border: OutlineInputBorder(),
        counterText: '',
      ),
      onChanged: context.read<PaymentModel>().setCvv,
    );
  }
}

// Pay Button
class _PayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final payment = context.watch<PaymentModel>();

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: payment.isValid ? Colors.green : Colors.grey,
        ),
        onPressed: payment.isLoading || !payment.isValid
            ? null
            : () => context.read<PaymentModel>().pay(),
        child: payment.isLoading
            ? CircularProgressIndicator(color: Colors.white)
            : Text(
                'PAY \$${payment.amount.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18),
              ),
      ),
    );
  }
}

// Success / Error Message
class _StatusMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentModel>(
      builder: (context, payment, child) {
        if (payment.success) {
          return Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Icon(Icons.check_circle, color: Colors.green, size: 48),
                SizedBox(height: 8),
                Text(
                  'Payment Successful!',
                  style: TextStyle(color: Colors.green.shade800, fontSize: 18),
                ),
                TextButton(
                  onPressed: payment.reset,
                  child: Text('Make Another Payment'),
                ),
              ],
            ),
          );
        }

        if (payment.error != null) {
          return Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(Icons.error, color: Colors.red),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    payment.error!,
                    style: TextStyle(color: Colors.red.shade800),
                  ),
                ),
              ],
            ),
          );
        }

        return SizedBox.shrink();
      },
    );
  }
}
