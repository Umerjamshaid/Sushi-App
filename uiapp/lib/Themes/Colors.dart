import 'package:flutter/material.dart';

// 🔴 Primary Colors
const primaryColor = Color(0xFFD32F2F); // Main Red
const primaryLight = Color(0xFFEF5350); // Lighter Red
const primaryDark = Color(0xFFC62828); // Darker Red

// 🟠 Secondary Colors
const secondaryColor = Color(0xFFFF6F00); // Orange accent
const secondaryLight = Color(0xFFFF9800);
const secondaryDark = Color(0xFFE65100);

// ⚪ Neutral Colors
const backgroundColor = Color(0xFFF5F5F5); // Light gray background
const surfaceColor = Color(0xFFFFFFFF); // White surface
const cardColor = Color(0xFFFAFAFA); // Off-white for cards

// 📝 Text Colors
const textPrimary = Color(0xFF212121); // Dark text
const textSecondary = Color(0xFF757575); // Gray text
const textHint = Color(0xFFBDBDBD); // Light gray for hints

// ✅ Status Colors
const successColor = Color(0xFF4CAF50); // Green
const warningColor = Color(0xFFFF9800); // Orange
const errorColor = Color(0xFFF44336); // Red
const infoColor = Color(0xFF2196F3); // Blue

// 🎯 Accent Colors
const accentGold = Color(0xFFFFB300); // For ratings/stars
const accentPurple = Color(0xFF9C27B0); // Optional accent

// 🌑 Dark Mode Colors (bonus!)
const darkBackground = Color(0xFF121212);
const darkSurface = Color(0xFF1E1E1E);
const darkCard = Color(0xFF2C2C2C);

// 💡 Utility Function: Get color with opacity
Color getColorWithOpacity(Color color, double opacity) {
  return color.withOpacity(opacity);
}

// 🎨 Gradient Definitions
const primaryGradient = LinearGradient(
  colors: [primaryColor, primaryLight],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

const cardGradient = LinearGradient(
  colors: [Color(0xFFFFFFFF), Color(0xFFF5F5F5)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
