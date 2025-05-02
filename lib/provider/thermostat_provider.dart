import 'dart:math';

import 'package:flutter/material.dart';

import '../models/device.dart';
import '../models/thermostat.dart';

class ThermostatProvider extends ChangeNotifier {
  final List<Device> _thermostats = [
    Thermostat(
      id: 'thermostat',
      name: 'Out Thermo',
      image:
          'https://jasonvbarger.com/wp-content/uploads/2015/04/Thermostat-e1430152340264.jpg',
    ),
  ];

  List<Device> get thermostats => _thermostats;

  void changeThermoState(Thermostat thermo) {
    final index = _thermostats.indexOf(thermo);
    if (index != -1) {
      _thermostats[index] = thermo.copyWith(isTurnedOn: !thermo.isTurnedOn);
    }
    notifyListeners();
  }

  void randTemp(Thermostat thermo) {
    final index = _thermostats.indexWhere((t) => t.id == thermo.id);
    if (index != -1) {
      _thermostats[index] = thermo.copyWith(
        temperature: Random().nextInt(11) + 20,
      );
    }
    notifyListeners();
  }

  void setThermoName(Thermostat thermo, String newName) {
    final index = _thermostats.indexWhere((t) => t.id == thermo.id);
    if (index != -1) {
      _thermostats[index] = thermo.copyWith(name: newName);
    }
    notifyListeners();
  }
}
