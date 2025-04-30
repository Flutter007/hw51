import 'package:flutter/material.dart';

class PanelOfDevicesScreen extends StatefulWidget {
  const PanelOfDevicesScreen({super.key});

  @override
  State<PanelOfDevicesScreen> createState() => _PanelOfDevicesScreenState();
}

class _PanelOfDevicesScreenState extends State<PanelOfDevicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Pick anyone!')));
  }
}
