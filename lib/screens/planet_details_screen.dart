import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import '../core/app_colors.dart';
import '../models/planet_model.dart';
import '../widgets/space_header.dart';

class PlanetDetailsScreen extends StatelessWidget {
  final PlanetModel planet;

  const PlanetDetailsScreen({super.key, required this.planet});

  Widget _fact(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        '$label : $value',
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          SpaceHeader(title: planet.name, showBack: true),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  planet.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 16),

                // 3D لو فيه موديل، وإلا الصورة
                SizedBox(
                  height: 343,
                  width: double.infinity,
                  child: planet.model != null
                      ? Flutter3DViewer(src: planet.model!)
                      : Image.asset(
                    planet.detailsImage ?? planet.image,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 24),

                const Text(
                  'About',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  planet.about,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 16),

                _fact('Distance from Sun (km)', planet.distanceFromSun),
                _fact('Length of Day (hours)', planet.lengthOfDay),
                _fact('Orbital Period (Earth years)', planet.orbitalPeriod),
                _fact('Radius (km)', planet.radius),
                _fact('Mass (kg)', planet.mass),
                _fact('Gravity (m/s²)', planet.gravity),
                _fact('Surface Area (km²)', planet.surfaceArea),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}