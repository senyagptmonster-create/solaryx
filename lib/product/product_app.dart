import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'solaryx_store.dart';
import 'screens.dart';

class ProductApp extends StatelessWidget {
  const ProductApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SolaryxStore()),
      ],
      child: MaterialApp(
        title: 'Solaryx',
        debugShowCheckedModeBanner: false,
        home: const SolaryxHome(),
      ),
    );
  }
}
