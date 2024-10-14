import 'package:equatable/equatable.dart';

class LocalTimeEntity extends Equatable {
  final int hour;
  final int minute;
  final int second;
  final int nano;

  const LocalTimeEntity({
    required this.hour,
    required this.minute,
    required this.second,
    required this.nano,
  });

  @override
  List<Object?> get props => [
        hour,
        minute,
        second,
        nano,
      ];
}
