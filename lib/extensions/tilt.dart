extension Tilt on double? {
  int toShade() {
    double res = (this ?? 0).abs();
    if (res > 2) res = 2;
    return ((res * 450) ~/ 100) * 100;
  }
}