import 'package:flutter/material.dart';

class AppDecorations {}

class AppTextStyles {}

class Resources {
  static AppColors colors = AppColors();
  static AppDecorations decorations = AppDecorations();
  static AppTextStyles textStyles = AppTextStyles();
}

class AppColors {
  final _Container container = _Container();
  final _Scaffold scaffold = _Scaffold();
  final _Text text = _Text();
}

class _Container {
  Color redBackGround = Colors.red;
}

class _Scaffold {
  Color mobileBackGround = Colors.blue;
}

class _Text {
  Color textColor = Colors.green;
}
