// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:werdy/model/hadith.dart';
import './networking_page_content.dart';

class NetworkingPage extends StatelessWidget {

  final Hadith? hadith;
  final String? data;
  NetworkingPage( {this.hadith,this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          NetworkingPageContent(data: data,),
        ],
      ),

    );
  }
}