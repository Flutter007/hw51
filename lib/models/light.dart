import 'device.dart';

class Light extends Device {
  bool isTurnedOn;

  Light({
    required super.id,
    required super.name,
    required super.image,
    this.isTurnedOn = false,
  });

  Light copyWith({String? id, String? name, String? image, bool? isTurnedOn}) {
    return Light(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      isTurnedOn: isTurnedOn ?? this.isTurnedOn,
    );
  }
}
