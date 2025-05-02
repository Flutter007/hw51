import 'package:flutter/material.dart';
import 'custom_text.dart';

class DeviceCard extends StatelessWidget {
  final String name;
  final String image;
  final Color backgroundColor;
  final Widget trailingIcon;
  final void Function() onPressed;
  final String? temperature;
  final bool showTemp;

  const DeviceCard({
    super.key,
    required this.name,
    required this.image,
    required this.backgroundColor,
    required this.trailingIcon,
    required this.onPressed,
    this.temperature,
    this.showTemp = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Container(
              height: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 12),
            Expanded(child: CustomText(txt: name)),
            if (showTemp && temperature != null)
              Expanded(child: CustomText(txt: temperature!)),
            IconButton(onPressed: onPressed, icon: trailingIcon),
          ],
        ),
      ),
    );
  }
}
