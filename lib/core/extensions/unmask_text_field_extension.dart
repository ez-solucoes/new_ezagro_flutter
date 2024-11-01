extension Unmask on String {
  String get unmask => replaceAll(RegExp(r'[^0-9]'), '');
}
