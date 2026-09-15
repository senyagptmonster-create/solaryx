import 'package:flutter/material.dart';
import '../theme/solaryx_theme.dart';

class GoldenHourScreen extends StatelessWidget {
  const GoldenHourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Golden & Blue Hours')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: SolaryxTheme.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: SolaryxTheme.amber.withValues(alpha: 0.3)),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Morning Golden Hour: 05:48 - 06:34 AM', style: TextStyle(fontWeight: FontWeight.bold, color: SolaryxTheme.gold)),
                  SizedBox(height: 6),
                  Text('Optimal for warm portraiture and landscape specular highlights.', style: TextStyle(fontSize: 12, color: SolaryxTheme.textSecondary)),
                  Divider(color: Colors.white10, height: 24),
                  Text('Evening Golden Hour: 19:12 - 19:58 PM', style: TextStyle(fontWeight: FontWeight.bold, color: SolaryxTheme.amber)),
                  SizedBox(height: 6),
                  Text('Rich horizontal light penetration with 3500K color temperature.', style: TextStyle(fontSize: 12, color: SolaryxTheme.textSecondary)),
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
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Blue Hour Schedules', style: TextStyle(fontWeight: FontWeight.bold, color: SolaryxTheme.sky)),
                  SizedBox(height: 6),
                  Text('Morning Blue Hour: 05:15 - 05:48 AM\nEvening Blue Hour: 20:00 - 20:32 PM', style: TextStyle(fontSize: 13, height: 1.5, color: SolaryxTheme.textPrimary)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
