import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hw51/models/light.dart';
import 'package:hw51/models/thermostat.dart';
import 'package:hw51/provider/light_provider.dart';
import 'package:hw51/widgets/light_grid.dart';
import 'package:provider/provider.dart';
import '../models/device.dart';
import '../models/lock.dart';
import '../provider/thermostat_provider.dart';
import '../widgets/thermo_card.dart';

class PanelOfDevicesScreen extends StatefulWidget {
  const PanelOfDevicesScreen({super.key});

  @override
  State<PanelOfDevicesScreen> createState() => _PanelOfDevicesScreenState();
}

class _PanelOfDevicesScreenState extends State<PanelOfDevicesScreen> {
  late List<Light> lights;
  late List<Thermostat> thermostats;
  late List<Lock> locks;
  late List<Device> devices;
  late Timer timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 5), (timer) async {
      changeTemp(thermostats[0]);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    lights = context.read<LighterProvider>().lights;
    thermostats = context.read<ThermostatProvider>().thermostats;
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void changeTemp(Thermostat thermo) {
    context.read<ThermostatProvider>().randTemp(thermo);
  }

  void changeLightState(Light light) {
    context.read<LighterProvider>().changeLightState(light);
  }

  void changeThermoState(Thermostat thermo) {
    context.read<ThermostatProvider>().changeThermoState(thermo);
  }

  @override
  Widget build(BuildContext context) {
    final lightProvider = context.watch<LighterProvider>();
    final thermoProvider = context.watch<ThermostatProvider>();
    final lights = lightProvider.lights;
    final thermostats = thermoProvider.thermostats;
    return Scaffold(
      appBar: AppBar(title: Text('Pick anyone!')),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: lights.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder:
                  (ctx, index) => LightGrid(
                    light: lights[index],
                    changeState: changeLightState,
                  ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: thermostats.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder:
                  (ctx, index) => ThermoGrid(
                    thermostat: thermostats[index],
                    changeState: changeThermoState,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
