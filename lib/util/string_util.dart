bool isNotEmpty(String? text) {
  return text?.isNotEmpty ?? false;
}

bool isEmpty(String? text) {
  return text?.isEmpty ?? true;
}

extension StringExtension on String? {
  bool get isEmpty => this?.isEmpty ?? true;

  bool get isNullOrEmpty => this == null || this!.isEmpty;

  bool get isNotEmpty => this?.isNotEmpty ?? false;
}
