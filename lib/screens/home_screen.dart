import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../data/planets_data.dart';
import '../widgets/explore_button.dart';
import '../widgets/round_arrow_button.dart';
import '../widgets/space_header.dart';
import 'planet_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _controller = PageController();
  int _index = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _goTo(int page) {
    if (page < 0 || page >= planets.length) return;
    _controller.animateToPage(
      page,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final planet = planets[_index];

    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          const SpaceHeader(title: 'Explore'),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Which planet\nwould you like to explore?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ),
          ),

          // PageView بصور الكواكب
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: planets.length,
              onPageChanged: (value) => setState(() => _index = value),
              itemBuilder: (context, i) {
                return AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    double page = _index.toDouble();
                    if (_controller.hasClients &&
                        _controller.position.haveDimensions) {
                      page = _controller.page ?? page;
                    }
                    final scale =
                    (1 - (page - i).abs() * 0.3).clamp(0.7, 1.0);
                    return Transform.scale(scale: scale, child: child);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 16,
                    ),
                    child: Image.asset(planets[i].image, fit: BoxFit.contain),
                  ),
                );
              },
            ),
          ),

          // الأسهم + اسم الكوكب
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RoundArrowButton(
                  icon: Icons.arrow_back,
                  onPressed: () => _goTo(_index - 1),
                ),
                Text(
                  planet.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                RoundArrowButton(
                  icon: Icons.arrow_forward,
                  onPressed: () => _goTo(_index + 1),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // زرار Explore + اسم الكوكب
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: SafeArea(
              top: false,
              child: ExploreButton(
                text: 'Explore ${planet.name}',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PlanetDetailsScreen(planet: planet),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}