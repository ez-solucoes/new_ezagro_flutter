import 'package:equatable/equatable.dart';

class ArgParams extends Equatable {
  final dynamic firstArgs;
  final dynamic secondArgs;
  final dynamic thirdArgs;
  final dynamic fourthArgs;
  final dynamic fifthArgs;
  final dynamic sixthArgs;

  const ArgParams({this.firstArgs, this.secondArgs, this.thirdArgs, this.fourthArgs, this.fifthArgs, this.sixthArgs});

  @override
  List<Object?> get props => [firstArgs, secondArgs, thirdArgs, fourthArgs, fifthArgs, sixthArgs];

  // Map<String, dynamic> toQueryParams() {
  //   Map<String, dynamic> queryParams = {};
  //
  //   if (firstArgs != null) {
  //     queryParams['firstArgs'] = firstArgs;
  //   }
  //
  //   if (secondArgs != null) {
  //     queryParams['secondArgs'] = secondArgs;
  //   }
  //
  //   if (thirdArgs != null) {
  //     queryParams['thirdArgs'] = thirdArgs;
  //   }
  //
  //   return queryParams;
  // }

  Map<String, dynamic> mountQueryParam({
    required String firstParamName,
    String? secondParamName,
    String? thirdParamName,
    String? fourthParamName,
    String? fifthParamName,
    String? sixthParamName,
  }) {
    Map<String, dynamic> queryParams = {};
    if (firstArgs != null) {
      queryParams[firstParamName] = firstArgs is List ? firstArgs.join(',') : firstArgs.toString();
    }

    if (secondParamName != null && secondArgs != null) {
      queryParams[secondParamName] = secondArgs is List ? secondArgs.join(',') : secondArgs.toString();
    }

    if (thirdParamName != null && thirdArgs != null) {
      queryParams[thirdParamName] = thirdArgs is List ? thirdArgs.join(',') : thirdArgs.toString();
    }
    if (fourthParamName != null && fourthArgs != null) {
      queryParams[fourthParamName] = fourthArgs is List ? fourthArgs.join(',') : fourthArgs.toString();
    }
    if (fifthParamName != null && fifthArgs != null) {
      queryParams[fifthParamName] = fifthArgs is List ? fifthArgs.join(',') : fifthArgs.toString();
    }
    if (sixthParamName != null && sixthArgs != null) {
      queryParams[sixthParamName] = sixthArgs is List ? sixthArgs.join(',') : sixthArgs.toString();
    }

    return queryParams;
  }
}
