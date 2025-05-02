import 'package:flutter/material.dart';
import '../models/device.dart';
import '../models/light.dart';

class LighterProvider extends ChangeNotifier {
  final List<Device> _lights = [
    Light(
      id: 'light',
      name: 'Hall lighter',
      image:
          'https://hiper-power.com/upload/iblock/7c3/33j5mwop2q2oistyhlmxdhk9ta72lw9v/IOT_LED%20A61%20RGB-2.jpg',
    ),
  ];

  List<Device> get lights => _lights;

  void changeLightState(Light light) {
    final index = _lights.indexWhere((t) => t.id == light.id);
    if (index != -1) {
      _lights[index] = light.copyWith(isTurnedOn: !light.isTurnedOn);
    }
    notifyListeners();
  }

  void setLightName(Light light, String newName) {
    final index = _lights.indexWhere((t) => t.id == light.id);
    if (index != -1) {
      _lights[index] = light.copyWith(name: newName);
    }
    notifyListeners();
  }
}
