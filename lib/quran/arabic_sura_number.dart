// ignore_for_file: use_key_in_widget_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:werdy/quran/arabic_no_converter.dart';

class ArabicSuraNumber extends StatelessWidget {
  const ArabicSuraNumber({Key? key, required this.num});

  final int num;

  @override
  Widget build(BuildContext context) {
    return Text(
      "\uFD3E" + (num + 1).toString().toArabicNumbers + "\uFD3F",
      style: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontFamily: 'me_quran',
          fontSize: 20,
          shadows: [
            Shadow(
                offset: Offset(0.5, 0.5),
                blurRadius: 1.0,
                color: Colors.amberAccent),
          ]),
    );
  }
}
