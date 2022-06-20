import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

class Responsive {
  late double _width, _height, _diagonal;

  static Responsive of(BuildContext context) => Responsive(context);

  Responsive(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    _width = size.width;
    _height = size.height;
    _diagonal = math.sqrt((_width * _width) + (_height * _height));
  }

  double get width => _width;
  double get height => _height;
  double get diagonal => _diagonal;

  double wp(double percent) => _width * (percent / 100);
  double hp(double percent) => _height * (percent / 100);
  double dp(double percent) => _diagonal * (percent / 100);
}
