import 'package:flutter/material.dart';

class SolarPhase {
  final String name;
  final String timeRange;
  final String colorTemperature;
  final IconData icon;

  SolarPhase({
    required this.name,
    required this.timeRange,
    required this.colorTemperature,
    required this.icon,
  });
}

class SolaryxController extends ChangeNotifier {
  final List<SolarPhase> _phases = [
    SolarPhase(name: 'Dawn Blue Hour', timeRange: '05:40 - 06:15', colorTemperature: '9000K - 12000K', icon: Icons.nights_stay),
    SolarPhase(name: 'Morning Golden Hour', timeRange: '06:15 - 07:10', colorTemperature: '3000K - 3500K', icon: Icons.wb_sunny),
    SolarPhase(name: 'Midday Solar Crest', timeRange: '12:00 - 14:00', colorTemperature: '5500K - 6500K', icon: Icons.wb_twilight),
    SolarPhase(name: 'Evening Golden Hour', timeRange: '18:45 - 19:40', colorTemperature: '2500K - 3200K', icon: Icons.flare),
    SolarPhase(name: 'Dusk Blue Hour', timeRange: '19:40 - 20:15', colorTemperature: '8000K - 10000K', icon: Icons.bedtime),
  ];

  List<SolarPhase> get phases => List.unmodifiable(_phases);
}
