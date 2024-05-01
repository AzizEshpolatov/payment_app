import 'package:flutter/material.dart';

double heightLogin = 0.0;
double widthLogin = 0.0;

extension SizeUtils on int {
  double get hl => (this / 666) * heightLogin;

  double get wl => (this / 310) * widthLogin;

  SizedBox getHL() {
    return SizedBox(
      height: (this / 666) * heightLogin,
    );
  }

  SizedBox getWL() {
    return SizedBox(
      width: (this / 310) * widthLogin,
    );
  }
}