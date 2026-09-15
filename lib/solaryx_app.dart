import 'package:flutter/material.dart';
import 'screens/solar_hub_screen.dart';
import 'state/solar_scope.dart';
import 'theme/solaryx_theme.dart';

class SolaryxApp extends StatelessWidget {
  const SolaryxApp({super.key});

  @override
  Widget build(BuildContext context) {
    const solarData = SolarData(
      sunriseTime: '06:12 AM',
      sunsetTime: '19:48 PM',
      solarNoonTime: '13:00 PM',
      dayLength: '13h 36m',
      daylightProgress: 0.62,
      uvIndex: 6,
    );

    return SolarScope(
      data: solarData,
      child: MaterialApp(
        title: 'Solaryx Daylight Lab',
        debugShowCheckedModeBanner: false,
        theme: SolaryxTheme.themeData,
        home: const SolarHubScreen(),
      ),
    );
  }
}
