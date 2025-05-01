import 'package:flutter/material.dart';
import 'package:hw51/models/thermostat.dart';

class ThermoGrid extends StatelessWidget {
  final Thermostat thermostat;
  final void Function(Thermostat) changeState;

  const ThermoGrid({
    super.key,
    required this.thermostat,
    required this.changeState,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: NetworkImage(thermostat.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(child: Text(thermostat.name)),
            Text(thermostat.temperature.toString()),
            IconButton(
              onPressed: () => changeState(thermostat),
              icon: Icon(
                Icons.power_settings_new,
                color: thermostat.isTurnedOn ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
