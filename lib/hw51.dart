import 'package:flutter/material.dart';
import 'package:hw51/provider/light_provider.dart';
import 'package:hw51/provider/lock_provider.dart';
import 'package:hw51/provider/thermostat_provider.dart';
import 'package:hw51/screens/home_navigation_screen.dart';
import 'package:provider/provider.dart';

import 'app_routes.dart';

class Hw51 extends StatefulWidget {
  const Hw51({super.key});

  @override
  State<Hw51> createState() => _Hw51State();
}

class _Hw51State extends State<Hw51> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => LighterProvider()),
        ChangeNotifierProvider(create: (ctx) => LockProvider()),
        ChangeNotifierProvider(create: (ctx) => ThermostatProvider()),
      ],
      child: MaterialApp(
        initialRoute: AppRoutes.home,
        home: HomeNavigationScreen(),
      ),
    );
  }
}
