import 'package:flutter/material.dart';
import '../../common/golden_hour_tokens.dart';

class LightGuideView extends StatelessWidget {
  const LightGuideView({super.key});

  @override
  Widget build(BuildContext context) {
    final tips = [
      {'title': 'Backlit Hair Light', 'desc': 'Position subject directly between lens and sun for radiant rim luminescence.'},
      {'title': 'Diffused Catchlights', 'desc': 'Low elevation sun produces natural round catchlights in portrait irises.'},
      {'title': 'Long Architectural Shadows', 'desc': 'Raking angles accentuate masonry, brickwork and urban textures.'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Portrait Field Guide')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: tips.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, idx) {
          final t = tips[idx];
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: GoldenHourTokens.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: GoldenHourTokens.edge),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(t['title']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 6),
                Text(t['desc']!, style: const TextStyle(fontSize: 13, color: GoldenHourTokens.inkMuted, height: 1.3)),
              ],
            ),
          );
        },
      ),
    );
  }
}
