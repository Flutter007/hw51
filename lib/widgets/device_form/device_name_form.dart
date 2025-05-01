import 'package:flutter/material.dart';
import 'package:hw51/widgets/device_form/device_name_form_controller.dart';

class DeviceNameForm extends StatefulWidget {
  final DeviceNameFormController controller;
  const DeviceNameForm({super.key, required this.controller});

  @override
  State<DeviceNameForm> createState() => _DeviceNameFormState();
}

class _DeviceNameFormState extends State<DeviceNameForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.controller.formKey,
      child: Column(
        children: [
          TextFormField(
            controller: widget.controller.nameController,
            decoration: InputDecoration(labelText: 'Name of Device'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a name';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
