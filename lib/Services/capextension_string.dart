extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get fullCaps => this.toUpperCase();
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }

  String get capitalizeFirstofEach => this.split(" ").map((str) => str.capitalize()).join(" ");
}
