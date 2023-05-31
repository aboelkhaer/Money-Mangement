import 'package:flutter/material.dart';

class SizeConfig {
  static setHeight(BuildContext context, double h) {
    return MediaQuery.of(context).size.height * h;
  }

  static setWidth(BuildContext context, double w) {
    return MediaQuery.of(context).size.height * w;
  }
}
