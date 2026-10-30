import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class ExploreButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ExploreButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.red,
          foregroundColor: AppColors.white,
          elevation: 0,
          padding: const EdgeInsets.all(16),
          shape: const StadiumBorder(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            const Icon(Icons.arrow_forward, size: 22, color: AppColors.white),
          ],
        ),
      ),
    );
  }
}