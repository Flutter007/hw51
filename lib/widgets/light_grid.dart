import 'package:flutter/material.dart';
import 'package:hw51/models/light.dart';

class LightGrid extends StatelessWidget {
  final Light light;
  final void Function(Light) changeState;

  const LightGrid({super.key, required this.light, required this.changeState});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Container(
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: NetworkImage(light.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(child: Text(light.name)),
            IconButton(
              onPressed: () => changeState(light),
              icon: Icon(
                Icons.power_settings_new,
                color: light.isTurnedOn ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
