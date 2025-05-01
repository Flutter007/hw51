import 'package:hw51/models/device.dart';

class Thermostat extends Device {
  int temperature;
  bool isTurnedOn;

  Thermostat({
    required super.id,
    required super.name,
    required super.image,
    this.temperature = 20,
    this.isTurnedOn = false,
  });

  Thermostat copyWith({
    String? id,
    String? name,
    String? image,
    int? temperature,
    bool? isTurnedOn,
  }) {
    return Thermostat(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      temperature: temperature ?? this.temperature,
      isTurnedOn: isTurnedOn ?? this.isTurnedOn,
    );
  }
}
