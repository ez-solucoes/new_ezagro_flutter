import 'package:equatable/equatable.dart';

class ArgParams extends Equatable {
  final dynamic firstArgs;
  final dynamic secondArgs;
  final dynamic thirdArgs;

  const ArgParams({this.firstArgs, this.secondArgs, this.thirdArgs});

  @override
  List<Object?> get props => [firstArgs, secondArgs, thirdArgs];

  Map<String, dynamic> toQueryParams() {
    Map<String, dynamic> queryParams = {};

    if (firstArgs != null) {
      queryParams['firstArgs'] = firstArgs;
    }

    if (secondArgs != null) {
      queryParams['secondArgs'] = secondArgs;
    }

    if (thirdArgs != null) {
      queryParams['thirdArgs'] = thirdArgs;
    }

    return queryParams;
  }
}
