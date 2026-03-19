extension StringExtensions on String {
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }

  bool get isBlank => trim().isEmpty;

  int wordCount() => trim().isEmpty ? 0 : trim().split(RegExp(r'\s+')).length;
}