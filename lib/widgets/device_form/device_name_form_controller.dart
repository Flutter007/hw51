import 'package:flutter/cupertino.dart';

class DeviceNameFormController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();

  void dispose() {
    nameController.dispose();
  }
}
