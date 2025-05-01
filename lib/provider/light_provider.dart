import 'package:flutter/material.dart';

import '../models/light.dart';

class LighterProvider extends ChangeNotifier {
  final List<Light> _lights = [
    Light(
      id: 'light',
      name: 'Hall lighter',
      image:
          'https://hiper-power.com/upload/iblock/7c3/33j5mwop2q2oistyhlmxdhk9ta72lw9v/IOT_LED%20A61%20RGB-2.jpg',
    ),
  ];

  List<Light> get lights => _lights;

  void changeLightState(Light light) {
    final index = _lights.indexOf(light);
    if (index != -1) {
      _lights[index] = light.copyWith(isTurnedOn: !light.isTurnedOn);
    }
    notifyListeners();
  }
}
