import 'package:flutter/material.dart';

class SettingsOfDevicesScreen extends StatefulWidget {
  const SettingsOfDevicesScreen({super.key});

  @override
  State<SettingsOfDevicesScreen> createState() =>
      _SettingsOfDevicesScreenState();
}

class _SettingsOfDevicesScreenState extends State<SettingsOfDevicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Settings')));
  }
}
