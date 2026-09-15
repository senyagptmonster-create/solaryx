import 'package:flutter/material.dart';
import '../theme/solaryx_theme.dart';

class TwilightStagesScreen extends StatelessWidget {
  const TwilightStagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stages = [
      {'title': 'Civil Twilight', 'angle': '0 deg to 6 deg below horizon', 'desc': 'Sun is just below horizon. Artificial light unnecessary for outdoor activities.'},
      {'title': 'Nautical Twilight', 'angle': '6 deg to 12 deg below horizon', 'desc': 'Navigational horizon still visible; brighter navigational stars apparent.'},
      {'title': 'Astronomical Twilight', 'angle': '12 deg to 18 deg below horizon', 'desc': 'Sky darkness approaches true night. Optimal for deep-sky telescope imaging.'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Twilight Astrometry')),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: stages.length,
        separatorBuilder: (context, _) => const SizedBox(height: 12),
        itemBuilder: (ctx, i) {
          final s = stages[i];
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: SolaryxTheme.surface,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(s['title']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: SolaryxTheme.gold)),
                const SizedBox(height: 4),
                Text(s['angle']!, style: const TextStyle(fontSize: 12, color: SolaryxTheme.sky)),
                const SizedBox(height: 6),
                Text(s['desc']!, style: const TextStyle(fontSize: 13, color: SolaryxTheme.textSecondary, height: 1.3)),
              ],
            ),
          );
        },
      ),
    );
  }
}
