import 'dart:ffi';

import 'package:flutter/material.dart';

class PaymentsModels {
  final int id;
  final double amount;
  final String cardholder;

  PaymentsModels({
    required this.id,
    required this.cardholder,
    required this.amount,
  });
}
