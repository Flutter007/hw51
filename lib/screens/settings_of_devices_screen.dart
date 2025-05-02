import 'package:flutter/material.dart';
import 'package:hw51/provider/thermostat_provider.dart';
import 'package:hw51/widgets/card_for_settings.dart';
import 'package:hw51/widgets/device_form/device_name_form_controller.dart';
import 'package:provider/provider.dart';
import '../models/device.dart';
import '../provider/light_provider.dart';
import '../provider/lock_provider.dart';
import '../widgets/device_form/device_name_form.dart';

class SettingsOfDevicesScreen extends StatefulWidget {
  const SettingsOfDevicesScreen({super.key});

  @override
  State<SettingsOfDevicesScreen> createState() =>
      _SettingsOfDevicesScreenState();
}

class _SettingsOfDevicesScreenState extends State<SettingsOfDevicesScreen> {
  final controller = DeviceNameFormController();
  late List<Device> devices;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    devices =
        context.read<LighterProvider>().lights +
        context.read<ThermostatProvider>().thermostats +
        context.read<LockProvider>().locks;
  }

  void openModalSheetForRename(Device device) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: DeviceNameForm(
            controller: controller,
            device: device,
            devices: devices,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings'), automaticallyImplyLeading: false),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: devices.length,
                itemBuilder:
                    (ctx, index) => CardForSettings(
                      txt: devices[index].name,
                      onTap: () => openModalSheetForRename(devices[index]),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
