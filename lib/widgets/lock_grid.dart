import 'package:flutter/material.dart';
import '../models/lock.dart';

class LockGrid extends StatelessWidget {
  final Lock lock;
  final void Function(Lock) changeState;

  const LockGrid({super.key, required this.lock, required this.changeState});

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
                  image: NetworkImage(lock.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(child: Text(lock.name)),
            IconButton(
              onPressed: () => changeState(lock),
              icon: Icon(
                lock.isLocked ? Icons.lock_outline : Icons.lock_open_outlined,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
