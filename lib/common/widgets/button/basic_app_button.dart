import 'package:flutter/material.dart';
import 'package:ww_slot_booking_fe_flutter/core/configs/theme/app_colors.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height; // Adjustable height
  final double? width; // Adjustable width
  final EdgeInsetsGeometry? padding; // Custom padding
  final double? fontSize; // Adjustable font size

  const BasicAppButton({
    required this.onPressed,
    required this.title,
    this.height,
    this.width,
    this.padding,
    this.fontSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width ?? double.infinity, height ?? 30), // Default height 50
        padding: padding ?? const EdgeInsets.symmetric(horizontal:20, vertical:20), // Default padding
        textStyle: TextStyle(
          fontSize: fontSize ?? 16, // Default font size
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: AppColors.primary, // Set button color
      ),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white), // Set text color
      ),
    );
  }
}
