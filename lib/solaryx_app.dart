import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'common/golden_hour_tokens.dart';
import 'modules/sun_clock/solaryx_controller.dart';
import 'modules/sun_clock/sun_clock_view.dart';
import 'modules/sun_calendar/sun_calendar_view.dart';
import 'modules/light_guide/light_guide_view.dart';
import 'modules/settings/sun_settings_view.dart';

class SolaryxApp extends StatelessWidget {
  const SolaryxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SolaryxController(),
      child: MaterialApp(
        title: 'Solaryx Sun Hours',
        debugShowCheckedModeBanner: false,
        theme: GoldenHourTokens.theme,
        home: const _SolaryxShell(),
      ),
    );
  }
}

class _SolaryxShell extends StatefulWidget {
  const _SolaryxShell();

  @override
  State<_SolaryxShell> createState() => _SolaryxShellState();
}

class _SolaryxShellState extends State<_SolaryxShell> {
  int _idx = 0;

  final List<Widget> _pages = const [
    SunClockView(),
    SunCalendarView(),
    LightGuideView(),
    SunSettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: GoldenHourTokens.edge),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.wb_sunny, color: GoldenHourTokens.accent, size: 40),
                  SizedBox(height: 10),
                  Text('Solaryx Daylight', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('Photographic Twilight Guide', style: TextStyle(fontSize: 12, color: GoldenHourTokens.inkMuted)),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.wb_twilight),
              title: const Text('Sun Hours'),
              selected: _idx == 0,
              onTap: () { setState(() => _idx = 0); Navigator.pop(context); },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today_outlined),
              title: const Text('Ephemeris'),
              selected: _idx == 1,
              onTap: () { setState(() => _idx = 1); Navigator.pop(context); },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: const Text('Light Guide'),
              selected: _idx == 2,
              onTap: () { setState(() => _idx = 2); Navigator.pop(context); },
            ),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text('Settings'),
              selected: _idx == 3,
              onTap: () { setState(() => _idx = 3); Navigator.pop(context); },
            ),
          ],
        ),
      ),
      body: _pages[_idx],
    );
  }
}
