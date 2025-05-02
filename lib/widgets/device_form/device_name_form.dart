import 'package:flutter/material.dart';
import 'package:hw51/widgets/device_form/device_name_form_controller.dart';
import 'package:provider/provider.dart';
import '../../models/device.dart';
import '../../models/light.dart';
import '../../models/lock.dart';
import '../../models/thermostat.dart';
import '../../provider/light_provider.dart';
import '../../provider/lock_provider.dart';
import '../../provider/thermostat_provider.dart';

class DeviceNameForm extends StatefulWidget {
  final DeviceNameFormController controller;
  final Device device;
  final List<Device> devices;
  const DeviceNameForm({
    super.key,
    required this.controller,
    required this.device,
    required this.devices,
  });

  @override
  State<DeviceNameForm> createState() => _DeviceNameFormState();
}

class _DeviceNameFormState extends State<DeviceNameForm> {
  @override
  void initState() {
    super.initState();
    widget.controller.nameController.text = widget.device.name;
  }

  void saveSettings() {
    if (widget.controller.formKey.currentState!.validate()) {
      for (var device in widget.devices) {
        if (device is Light && device.id == widget.device.id) {
          context.read<LighterProvider>().setLightName(
            device,
            widget.controller.nameController.text,
          );
        } else if (device is Thermostat && device.id == widget.device.id) {
          context.read<ThermostatProvider>().setThermoName(
            device,
            widget.controller.nameController.text,
          );
        } else if (device is Lock && device.id == widget.device.id) {
          context.read<LockProvider>().setLockName(
            device,
            widget.controller.nameController.text,
          );
        }
      }
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return SafeArea(
      child: Form(
        key: widget.controller.formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(bottom: bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: widget.controller.nameController,
                  decoration: InputDecoration(labelText: 'Name of Device'),
                  validator: (value) {
                    for (final device in widget.devices) {
                      if (device.name == value) {
                        return 'Device with this name already exists';
                      }
                    }
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: saveSettings,
                  child: Text('Save Settings'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
