abstract class ApplicationError implements Exception {
  ApplicationError({
    required this.friendlyMessage,
    this.causedBy,
    this.fingerprint,
    this.additionalInfo,
  });

  final String friendlyMessage;
  final String? causedBy;
  final String? fingerprint;
  final String? additionalInfo;

  String get name;

  @override
  String toString() {
    var b = StringBuffer()..write('$name: $friendlyMessage');
    if(causedBy != null) {
      b.write('\n');
      b.write('Caused by: $causedBy');
    }
    if (fingerprint != null) {
      b.write('\n');
      b.write('On: $fingerprint');
    }
    if (additionalInfo != null) {
      b.write('\n');
      b.write('Additional info: $additionalInfo');
    }
    return b.toString();
  }
}