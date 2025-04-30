import 'package:flutter/material.dart';
import 'package:hw51/screens/home_navigation_screen.dart';

import 'app_routes.dart';

class Hw51 extends StatefulWidget {
  const Hw51({super.key});

  @override
  State<Hw51> createState() => _Hw51State();
}

class _Hw51State extends State<Hw51> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.home,
      home: HomeNavigationScreen(),
    );
  }
}
