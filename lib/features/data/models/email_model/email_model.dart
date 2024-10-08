import 'dart:convert';
import '../../../domain/entities/email_entities/email_entity.dart';

class EmailModel extends EmailEntity {

  EmailModel({required super.id, required super.email});

  Map<String, dynamic> toMap() => {
    'id': id,
    'email':email,
  };

  factory EmailModel.fromMap(Map<String, dynamic> map) => EmailModel(
    id: map['id'],
    email: map['email'],
  );

  String toJson() => json.encode(toMap());

  factory EmailModel.fromJson(String source) =>
      EmailModel.fromMap(json.decode(source));

}