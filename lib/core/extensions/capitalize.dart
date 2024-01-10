extension ToCapitalize on String {
  String toCapitalize() {
    final label = this;
    return '${label.substring(0, 1).toUpperCase()}${label.substring(1)}';
  }
}
