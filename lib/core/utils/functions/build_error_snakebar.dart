import 'package:bookly_app/features/home/presentation/view_models/Feature_Books_Cubit/state.dart';
import 'package:flutter/material.dart';

SnackBar Custom_Error_Widget(String Err_message) {
  return SnackBar(
    content: Row(
      children: [
        const Icon(Icons.error_outline, color: Colors.white),
        const SizedBox(width: 8),
        Text(
          Err_message,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    ),
    backgroundColor: Colors.red,
    duration: const Duration(seconds: 3),
  );
}
