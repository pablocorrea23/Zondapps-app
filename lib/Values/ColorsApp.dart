// ignore_for_file: file_names

import 'package:flutter/material.dart';

Color? get icon1Color => Colors.pink[300];
Color? get icon2Color => Colors.blue[500];
Color? get iconDark => Colors.black;

Color? get textColor1 => Colors.blueGrey;
Color? get textColor2 => Colors.pink[200];
Color get textDark => Colors.white;

Color get testHex => hexToColor('#2b4460');
Color get fondoApp => hexToColor('#5a0413');
Color get bottomBar => hexToColor('#344763');


Color hexToColor(String code) =>
    Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
