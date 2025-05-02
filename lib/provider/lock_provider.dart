import 'package:flutter/material.dart';
import 'package:hw51/models/device.dart';

import '../models/lock.dart';

class LockProvider extends ChangeNotifier {
  final List<Device> _locks = [
    Lock(
      id: 'lock',
      name: 'Entry Lock',
      image:
          'https://play-lh.googleusercontent.com/19GU_MtEUEYBvY-TUH6IF96d8AyGYYZoeob1eDQymFXaQb9qtZADzAIFKWoYPFtDci4',
    ),
  ];
  List<Device> get locks => _locks;

  void changeLockState(Lock lock) {
    final index = _locks.indexWhere((t) => t.id == lock.id);
    if (index != -1) {
      _locks[index] = lock.copyWith(isLocked: !lock.isLocked);
    }
    notifyListeners();
  }

  void setLockName(Lock lock, String newName) {
    final index = _locks.indexWhere((t) => t.id == lock.id);
    if (index != -1) {
      _locks[index] = lock.copyWith(name: newName);
    }
    notifyListeners();
  }
}
