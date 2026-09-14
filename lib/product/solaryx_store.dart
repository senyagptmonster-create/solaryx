import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class SolaryxStore extends ChangeNotifier {
  List<String> logs = [];

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    logs = prefs.getStringList('sol_logs') ?? [];
    if (logs.isEmpty) {
      try {
        final jsonStr = await rootBundle.loadString('packages/solaryx/content.json');
        final data = jsonDecode(jsonStr);
        logs = List<String>.from(data['logs']);
      } catch (e) {
        // Fallback
      }
    }
    notifyListeners();
  }
}
