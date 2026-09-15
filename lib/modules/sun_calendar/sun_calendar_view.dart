import 'package:flutter/material.dart';
import '../../common/golden_hour_tokens.dart';

class SunCalendarView extends StatelessWidget {
  const SunCalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Solar Ephemeris')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: GoldenHourTokens.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: GoldenHourTokens.edge),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Solar Elevation & Azimuth', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                SizedBox(height: 8),
                Text(
                  'During Golden Hour, the sun sits between 6° and -4° above the horizon. Light passes through atmospheric dust, scattering short blue wavelengths and bathing subjects in soft warm reds and oranges.',
                  style: TextStyle(fontSize: 13, color: GoldenHourTokens.inkMuted, height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
