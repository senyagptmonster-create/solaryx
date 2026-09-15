import 'package:flutter/material.dart';
import '../state/solar_scope.dart';
import '../theme/solaryx_theme.dart';

class SolarNoonScreen extends StatelessWidget {
  const SolarNoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final solar = SolarScope.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Solar Noon & Elevation')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: SolaryxTheme.surface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Text('Peak Zenith Solar Noon', style: TextStyle(color: SolaryxTheme.textSecondary)),
                  const SizedBox(height: 6),
                  Text(solar.solarNoonTime, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: SolaryxTheme.gold)),
                  const SizedBox(height: 12),
                  const Text('Sun elevation angle: 68.4 deg above horizon', style: TextStyle(fontSize: 13, color: SolaryxTheme.textPrimary)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: SolaryxTheme.surface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                'Solar Panels Guidance:\nTilt panel azimuth true South with 32 deg pitch for optimal year-round photovoltaic capture.',
                style: TextStyle(fontSize: 13, color: SolaryxTheme.textSecondary, height: 1.4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
