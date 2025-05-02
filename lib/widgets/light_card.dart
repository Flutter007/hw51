import 'package:flutter/material.dart';
import 'package:hw51/models/light.dart';
import 'device_card.dart';

class LightCard extends StatelessWidget {
  final Light light;
  final void Function(Light) changeState;

  const LightCard({super.key, required this.light, required this.changeState});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DeviceCard(
      name: light.name,
      image: light.image,
      backgroundColor:
          light.isTurnedOn
              ? theme.colorScheme.primaryContainer
              : theme.colorScheme.errorContainer,
      trailingIcon: Icon(
        Icons.power_settings_new,
        color: light.isTurnedOn ? Colors.green : Colors.red,
        size: 60,
      ),
      onPressed: () => changeState(light),
    );
  }
}
