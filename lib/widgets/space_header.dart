import 'package:flutter/material.dart';
import '../core/app_assets.dart';
import '../core/app_colors.dart';
import 'round_arrow_button.dart';

/// Stacked layers: Image + Gradient + Title (+ Back button اختياري)
class SpaceHeader extends StatelessWidget {
  final String title;
  final bool showBack;

  const SpaceHeader({super.key, required this.title, this.showBack = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Layer 1: الصورة
          Image.asset(
            AppAssets.headerBg,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
          // Layer 2: الـ Gradient
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, AppColors.black],
              ),
            ),
          ),
          // Layer 3: العنوان وزرار الرجوع
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  if (showBack)
                    Align(
                      alignment: Alignment.topLeft,
                      child: RoundArrowButton(
                        icon: Icons.arrow_back,
                        size: 36,
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}