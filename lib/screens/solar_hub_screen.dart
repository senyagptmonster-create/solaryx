import 'package:flutter/material.dart';
import '../painters/sun_arc_painter.dart';
import '../state/solar_scope.dart';
import '../theme/solaryx_theme.dart';
import 'golden_hour_screen.dart';
import 'solar_noon_screen.dart';
import 'twilight_stages_screen.dart';

class SolarHubScreen extends StatelessWidget {
  const SolarHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final solar = SolarScope.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Solaryx Daylight Lab'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Sun Arc Canvas
              SizedBox(
                height: 160,
                child: CustomPaint(
                  painter: SunArcPainter(progress: solar.daylightProgress),
                ),
              ),

              // Sun times summary
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildSolarPoint('SUNRISE', solar.sunriseTime, Icons.wb_twilight_rounded),
                  _buildSolarPoint('DAY LENGTH', solar.dayLength, Icons.timelapse_rounded),
                  _buildSolarPoint('SUNSET', solar.sunsetTime, Icons.nights_stay_rounded),
                ],
              ),
              const SizedBox(height: 24),

              const Text(
                'SOLAR TELEMETRY HUB',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: SolaryxTheme.textSecondary,
                ),
              ),
              const SizedBox(height: 12),

              // 2x2 Dashboard Cards
              Row(
                children: [
                  Expanded(
                    child: _buildHubCard(
                      context,
                      title: 'Golden Hour',
                      subtitle: 'Photography light times',
                      icon: Icons.camera_alt_rounded,
                      color: SolaryxTheme.amber,
                      destination: const GoldenHourScreen(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildHubCard(
                      context,
                      title: 'Solar Noon',
                      subtitle: 'Peak zenith & panel tilt',
                      icon: Icons.wb_sunny_rounded,
                      color: SolaryxTheme.gold,
                      destination: const SolarNoonScreen(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildHubCard(
                      context,
                      title: 'Twilight Stages',
                      subtitle: 'Civil, Nautical, Astro',
                      icon: Icons.dark_mode_rounded,
                      color: SolaryxTheme.sky,
                      destination: const TwilightStagesScreen(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: SolaryxTheme.surface,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.shield_rounded, color: Colors.orangeAccent, size: 28),
                          const SizedBox(height: 8),
                          const Text('UV Index', style: TextStyle(fontWeight: FontWeight.bold, color: SolaryxTheme.textPrimary)),
                          const SizedBox(height: 4),
                          Text('Rating: ${solar.uvIndex} (Moderate)', style: const TextStyle(fontSize: 12, color: SolaryxTheme.textSecondary)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSolarPoint(String label, String time, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: SolaryxTheme.amber, size: 20),
        const SizedBox(height: 4),
        Text(time, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: SolaryxTheme.textPrimary)),
        Text(label, style: const TextStyle(fontSize: 10, color: SolaryxTheme.textSecondary)),
      ],
    );
  }

  Widget _buildHubCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required Widget destination,
  }) {
    final solar = SolarScope.of(context);

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => SolarScope(data: solar, child: destination),
          ),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: SolaryxTheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: SolaryxTheme.textPrimary)),
            const SizedBox(height: 4),
            Text(subtitle, style: const TextStyle(fontSize: 12, color: SolaryxTheme.textSecondary)),
          ],
        ),
      ),
    );
  }
}
