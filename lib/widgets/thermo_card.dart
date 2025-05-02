import 'package:flutter/material.dart';
import 'package:hw51/models/thermostat.dart';
import 'device_card.dart';

class ThermoCard extends StatelessWidget {
  final Thermostat thermostat;
  final void Function(Thermostat) changeState;

  const ThermoCard({
    super.key,
    required this.thermostat,
    required this.changeState,
  });

  @override
  Widget build(BuildContext context) {
    return DeviceCard(
      name: thermostat.name,
      image: thermostat.image,
      backgroundColor: Theme.of(context).cardColor,
      showTemp: thermostat.isTurnedOn,
      temperature: '${thermostat.temperature}°C',
      trailingIcon: Icon(
        Icons.power_settings_new,
        color: thermostat.isTurnedOn ? Colors.green : Colors.red,
        size: 60,
      ),
      onPressed: () => changeState(thermostat),
    );
  }
}
