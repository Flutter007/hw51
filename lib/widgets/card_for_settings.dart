import 'package:flutter/material.dart';

class CardForSettings extends StatelessWidget {
  final String txt;
  final void Function() onTap;
  const CardForSettings({super.key, required this.txt, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      radius: 20,
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.all(14),
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Text(
            txt,
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
