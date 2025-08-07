import 'package:flutter/material.dart';

import 'package:mdk_on_air/const/style.dart';

class StudioState {
  final String text;
  final Color bgColor;
  final Color fontColor;
  final TextStyle fontStyle;


  StudioState({
    required this.text,
    required this.bgColor,
    required this.fontColor,
    this.fontStyle = DEFAULT_FONT_STYLE,
  });
}
