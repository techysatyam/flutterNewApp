import 'package:flutter/material.dart';

class AppStyles {
  static BoxShadow boxShadow = BoxShadow(
    color: Colors.black.withOpacity(0.05), // Adjust color opacity as needed
    blurRadius: 33.0, // Blur effect
    spreadRadius: 0.0, // How much it spreads
    offset: const Offset(4, 4), // Position (X, Y)
  );
}
