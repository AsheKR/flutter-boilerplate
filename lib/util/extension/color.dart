import 'dart:ui';

extension AlphaPercentage on Color {
  Color withAlphaPercentage(int a) {
    return withAlpha(_convertAlphaToHexDecimal(a));
  }

  int _convertAlphaToHexDecimal(int alphaDecimal) {
    final alpha = alphaDecimal / 100;
    return (alpha * 255).round();
  }
}
