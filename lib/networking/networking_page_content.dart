// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api, prefer_spread_collections

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:werdy/constant/string.dart';

class NetworkingPageContent extends StatefulWidget {
  final String? data;

  NetworkingPageContent({this.data});

  @override
  _NetworkingPageContentState createState() => _NetworkingPageContentState();
}

class _NetworkingPageContentState extends State<NetworkingPageContent> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(""),
                  SvgPicture.asset("assets/svg/logo.svg"),
                  SvgPicture.asset("assets/svg/arrow-right.svg"),
                ],
              ),
              Column(
                //mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  TextApp.topHomeScreen,
                  TextApp.headerHomeScreen,
                ],
              ),
            ],
          ),
          _convertHadith(
            context,
            widget.data!,
          ),
        ],
      ),
    );
  }
}

RichText _convertHadith(BuildContext context, String text) {
  text = text.replaceAll('(', '{');
  text = text.replaceAll(')', '}');

  List<String> split = text.split(RegExp("{"));

  List<String> hadiths = split.getRange(1, split.length).fold([], (t, e) {
    var texts = e.split("}");

    if (texts.length > 1) {
      return List.from(t)..addAll(
          // ignore: unnecessary_string_interpolations
          ["{${texts.first}}", "${e.substring(texts.first.length + 1)}"]);
    }
    return List.from(t)..add("{${texts.first}");
  });

  return RichText(
    textAlign: TextAlign.right,
    text: TextSpan(
      style: const TextStyle(
        fontSize: 20,
        color: Colors.brown,
      ),
      //style: DefaultTextStyle.of(context).style,
      children: [TextSpan(text: split.first)]..addAll(hadiths
          .map(
            (text) => text.contains("{")
                ? TextSpan(
                    text: text,
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : TextSpan(text: text),
          )
          .toList()),
    ),
    textDirection: TextDirection.rtl,
  );
}
