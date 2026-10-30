import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class RoundArrowButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final double size;

  const RoundArrowButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.red,
          foregroundColor: AppColors.white,
          elevation: 0,
          padding: EdgeInsets.zero,
          shape: const CircleBorder(),
        ),
        child: Icon(icon, size: 22, color: AppColors.white),
      ),
    );
  }
}