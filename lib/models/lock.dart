import 'device.dart';

class Lock extends Device {
  bool isLocked;

  Lock({
    required super.id,
    required super.name,
    required super.image,
    this.isLocked = true,
  });
  Lock copyWith({String? id, String? name, String? image, bool? isLocked}) {
    return Lock(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      isLocked: isLocked ?? this.isLocked,
    );
  }
}
