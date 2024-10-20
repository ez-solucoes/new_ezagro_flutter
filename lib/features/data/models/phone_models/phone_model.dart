import 'dart:convert';

import 'package:new_ezagro_flutter/features/domain/entities/phone_entities/phone_entity.dart';

class PhoneModel extends PhoneEntity {
  PhoneModel(
      {required super.id, required super.number, super.whatsapp, super.active});

  Map<String, dynamic> toMap() =>
      {'id': id, 'number': number, 'whatsapp': whatsapp, 'active': active};

  factory PhoneModel.fromMap(Map<String, dynamic> map) => PhoneModel(
      id: map['id'],
      number: map['number'],
      whatsapp: map['whatsapp'],
      active: map['active']);

  String toJson() => json.encode(toMap());

  factory PhoneModel.fromJson(String source) =>
      PhoneModel.fromMap(json.decode(source));
}
