class PhoneEntity{
  final int id;
  final String number;
  final String? whatsapp;
  final bool? active;

  PhoneEntity({
    required this.id,
    required this.number,
    this.whatsapp,
    this.active,
  });
}