class PlanetModel {
  final String name;
  final String image; // صورة الكوكب في الـ Home
  final String? detailsImage; // صورة الـ Details (اختيارية)
  final String? model; // موديل 3D (اختياري)
  final String title;
  final String about;
  final String distanceFromSun;
  final String lengthOfDay;
  final String orbitalPeriod;
  final String radius;
  final String mass;
  final String gravity;
  final String surfaceArea;

  const PlanetModel({
    required this.name,
    required this.image,
    this.detailsImage,
    this.model,
    required this.title,
    required this.about,
    required this.distanceFromSun,
    required this.lengthOfDay,
    required this.orbitalPeriod,
    required this.radius,
    required this.mass,
    required this.gravity,
    required this.surfaceArea,
  });
}