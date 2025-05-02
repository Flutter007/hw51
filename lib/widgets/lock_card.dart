import 'package:flutter/material.dart';
import '../models/lock.dart';
import 'device_card.dart';

class LockCard extends StatelessWidget {
  final Lock lock;
  final void Function(Lock) changeState;

  const LockCard({super.key, required this.lock, required this.changeState});

  @override
  Widget build(BuildContext context) {
    return DeviceCard(
      name: lock.name,
      image: lock.image,
      backgroundColor: Theme.of(context).cardColor,
      trailingIcon: Icon(
        lock.isLocked ? Icons.lock_outline : Icons.lock_open_outlined,
        size: 60,
      ),
      onPressed: () => changeState(lock),
    );
  }
}
