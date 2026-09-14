import '../app/brand.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app/theme.dart';
import 'solaryx_store.dart';

class SolaryxHome extends StatefulWidget {
  const SolaryxHome({super.key});

  @override
  State<SolaryxHome> createState() => _SolaryxHomeState();
}

class _SolaryxHomeState extends State<SolaryxHome> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const SunClockScreen(),
    const ForecastScreen(),
    const PhotoLogScreen(),
    const SunMapScreen(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SolaryxStore>().loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBg,
      appBar: AppBar(
        title: Text('Solaryx', style: AppTheme.display(cInk)),
        backgroundColor: cSurface,
        iconTheme: const IconThemeData(color: cInk),
      ),
      drawer: Drawer(
        backgroundColor: cSurface,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: cAccent),
              child: Text('Solaryx Menu', style: AppTheme.display(Colors.white)),
            ),
            ListTile(
              title: Text('Sun Clock', style: AppTheme.text(cInk)),
              onTap: () { setState(() { _currentIndex = 0; }); Navigator.pop(context); },
            ),
            ListTile(
              title: Text('Forecast', style: AppTheme.text(cInk)),
              onTap: () { setState(() { _currentIndex = 1; }); Navigator.pop(context); },
            ),
            ListTile(
              title: Text('Photo Log', style: AppTheme.text(cInk)),
              onTap: () { setState(() { _currentIndex = 2; }); Navigator.pop(context); },
            ),
            ListTile(
              title: Text('Sun Map', style: AppTheme.text(cInk)),
              onTap: () { setState(() { _currentIndex = 3; }); Navigator.pop(context); },
            ),
          ],
        ),
      ),
      body: _screens[_currentIndex],
    );
  }
}

class SunClockScreen extends StatelessWidget {
  const SunClockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.wb_sunny, size: 80, color: cAccent),
          const SizedBox(height: 16),
          Text('Golden Hour', style: AppTheme.display(cInk)),
          Text('17:30 - 18:30', style: AppTheme.text(cInk)),
        ],
      ),
    );
  }
}

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Clear Skies, Great Light!', style: AppTheme.display(cInk)),
    );
  }
}

class PhotoLogScreen extends StatelessWidget {
  const PhotoLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.watch<SolaryxStore>();
    return ListView.builder(
      itemCount: store.logs.length,
      itemBuilder: (context, index) {
        return Card(
          color: cSurface,
          margin: const EdgeInsets.all(8),
          child: ListTile(
            title: Text(store.logs[index], style: AppTheme.text(cInk)),
            leading: const Icon(Icons.camera_alt, color: cAccent2),
          ),
        );
      },
    );
  }
}

class SunMapScreen extends StatelessWidget {
  const SunMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(Icons.map, size: 100, color: cEdge),
    );
  }
}
