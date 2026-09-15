import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'solaryx_controller.dart';
import '../../common/golden_hour_tokens.dart';

class SunClockView extends StatelessWidget {
  const SunClockView({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<SolaryxController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Daylight Tracker')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: ctrl.phases.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, idx) {
          final p = ctrl.phases[idx];
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: GoldenHourTokens.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: GoldenHourTokens.edge),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: GoldenHourTokens.edge,
                  foregroundColor: GoldenHourTokens.accent,
                  child: Icon(p.icon),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(p.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 4),
                      Text('Window: ${p.timeRange}', style: const TextStyle(fontSize: 13, color: GoldenHourTokens.inkMuted)),
                    ],
                  ),
                ),
                Text(
                  p.colorTemperature,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: GoldenHourTokens.accent),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
