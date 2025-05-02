import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hw51/models/light.dart';
import 'package:hw51/models/thermostat.dart';
import 'package:hw51/provider/light_provider.dart';
import 'package:hw51/widgets/light_card.dart';
import 'package:hw51/widgets/lock_card.dart';
import 'package:provider/provider.dart';
import '../models/device.dart';
import '../models/lock.dart';
import '../provider/lock_provider.dart';
import '../provider/thermostat_provider.dart';
import '../widgets/thermo_card.dart';

class PanelOfDevicesScreen extends StatefulWidget {
  const PanelOfDevicesScreen({super.key});

  @override
  State<PanelOfDevicesScreen> createState() => _PanelOfDevicesScreenState();
}

class _PanelOfDevicesScreenState extends State<PanelOfDevicesScreen> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    final thermostats = context.read<ThermostatProvider>().thermostats;
    timer = Timer.periodic(Duration(seconds: 5), (timer) async {
      changeTemp(thermostats[0] as Thermostat);
    });
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

  void changeLockState(Lock lock) {
    context.read<LockProvider>().changeLockState(lock);
  }

  @override
  Widget build(BuildContext context) {
    List<Device> devices =
        context.watch<LighterProvider>().lights +
        context.watch<ThermostatProvider>().thermostats +
        context.watch<LockProvider>().locks;

    return Scaffold(
      appBar: AppBar(title: Text('Smart Home App')),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 300,
                ),
                itemBuilder: (ctx, index) {
                  final device = devices[index];
                  if (device is Light) {
                    return LightCard(
                      light: device,
                      changeState: changeLightState,
                    );
                  } else if (device is Thermostat) {
                    return ThermoCard(
                      thermostat: device,
                      changeState: changeThermoState,
                    );
                  } else if (device is Lock) {
                    return LockCard(lock: device, changeState: changeLockState);
                  } else {
                    return Center();
                  }
                },
                itemCount: devices.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
