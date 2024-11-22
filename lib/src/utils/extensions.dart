import 'package:flutter/material.dart';

extension DoubleExtension on double {
  Widget get heightWidget => SizedBox(height: this);
  Widget get widthWidget => SizedBox(width: this);
}


extension CustomBuildContextExtension on BuildContext{

  double get height100 => MediaQuery.of(this).size.height;
  double get height90 => MediaQuery.of(this).size.height * 0.9;
  double get height80 => MediaQuery.of(this).size.height * 0.8;
  double get height70 => MediaQuery.of(this).size.height * 0.7;
  double get height60 => MediaQuery.of(this).size.height * 0.6;
  double get height50 => MediaQuery.of(this).size.height * 0.5;
  double get height40 => MediaQuery.of(this).size.height * 0.4;
  double get height30 => MediaQuery.of(this).size.height * 0.3;
  double get height20 => MediaQuery.of(this).size.height * 0.2;

  double get width100 => MediaQuery.of(this).size.width;


}
