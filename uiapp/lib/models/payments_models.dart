import 'package:flutter/material.dart';

class PaymentModel extends ChangeNotifier {
  // Private state
  String _cardNumber = '';
  String _cardHolder = '';
  String _expiry = '';
  String _cvv = '';
  double _amount = 0;
  bool _isLoading = false;
  String? _error;
  bool _success = false;

  // Getters
  String get cardNumber => _cardNumber;
  String get cardHolder => _cardHolder;
  String get expiry => _expiry;
  String get cvv => _cvv;
  double get amount => _amount;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get success => _success;

  // Validation
  bool get isValid =>
      _cardNumber.length == 16 &&
      _cardHolder.isNotEmpty &&
      _expiry.length == 5 &&
      _cvv.length == 3 &&
      _amount > 0;

  // Setters
  void setCardNumber(String value) {
    _cardNumber = value.replaceAll(' ', '');
    _clearError();
    notifyListeners();
  }

  void setCardHolder(String value) {
    _cardHolder = value;
    notifyListeners();
  }

  void setExpiry(String value) {
    _expiry = value;
    notifyListeners();
  }

  void setCvv(String value) {
    _cvv = value;
    notifyListeners();
  }

  void setAmount(String value) {
    _amount = double.tryParse(value) ?? 0;
    notifyListeners();
  }

  // Actions
  Future<void> pay() async {
    if (!isValid) {
      _error = 'Please fill all fields correctly';
      notifyListeners();
      return;
    }

    _isLoading = true;
    _error = null;
    notifyListeners();

    // Fake API call
    await Future.delayed(Duration(seconds: 2));

    // 90% success rate
    if (DateTime.now().millisecond % 10 != 0) {
      _success = true;
    } else {
      _error = 'Payment declined. Try again.';
    }

    _isLoading = false;
    notifyListeners();
  }

  void reset() {
    _cardNumber = '';
    _cardHolder = '';
    _expiry = '';
    _cvv = '';
    _amount = 0;
    _isLoading = false;
    _error = null;
    _success = false;
    notifyListeners();
  }

  void _clearError() {
    if (_error != null) {
      _error = null;
      notifyListeners();
    }
  }
}
