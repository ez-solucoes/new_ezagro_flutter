
extension Unmask on String {
  String get unmask => replaceAll(RegExp(r'[ˆ0-9]'), '');
}
