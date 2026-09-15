import 'package:flutter/material.dart';
import '../../common/golden_hour_tokens.dart';

class SunSettingsView extends StatelessWidget {
  const SunSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sun Hours Setup')),
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
                Text('Astronomical Calculation Engine', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                SizedBox(height: 8),
                Text(
                  'Computes civil twilight, nautical twilight, and solar noon coordinates completely offline without cloud API latency.',
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
