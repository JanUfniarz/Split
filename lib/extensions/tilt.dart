extension Tilt on double? {
  static const double _sensitivity = 0.05;

  int toShade() {
    double res = (this ?? 0).abs();
    if (res > _sensitivity && res < 0.22) return 50;
    if (res > 2) res = 2;
    return ((res * 450) ~/ 100) * 100;
  }
}