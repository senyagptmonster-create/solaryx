import 'package:flutter/material.dart';

class SolarData {
  final String sunriseTime;
  final String sunsetTime;
  final String solarNoonTime;
  final String dayLength;
  final double daylightProgress; // 0.0 to 1.0
  final int uvIndex;

  const SolarData({
    required this.sunriseTime,
    required this.sunsetTime,
    required this.solarNoonTime,
    required this.dayLength,
    required this.daylightProgress,
    required this.uvIndex,
  });
}

class SolarScope extends InheritedWidget {
  final SolarData data;

  const SolarScope({
    super.key,
    required this.data,
    required super.child,
  });

  static SolarData of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<SolarScope>();
    assert(scope != null, 'No SolarScope found in context');
    return scope!.data;
  }

  @override
  bool updateShouldNotify(covariant SolarScope oldWidget) {
    return oldWidget.data.daylightProgress != data.daylightProgress;
  }
}
