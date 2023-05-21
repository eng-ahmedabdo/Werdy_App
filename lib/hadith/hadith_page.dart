// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:werdy/constant/color.dart';
import 'package:werdy/constant/string.dart';
import 'package:werdy/db/data.dart';
import 'package:werdy/hadith/bottom_bar.dart';
import 'package:werdy/model/hadith.dart';

class HadithPage extends StatefulWidget {
  @override
  State<HadithPage> createState() => _HadithPageState();
}

class _HadithPageState extends State<HadithPage> {
  Widget ayah(String? key, name) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset("assets/img.png"),
        SvgPicture.asset("assets/svg/grey.svg"),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              key!,
              style: const TextStyle(
                fontSize: 16,
                color: MyColor.yellow1,
              ),
            ),
            Text(
              name,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: MyColor.yellow1,
              ),
              textScaleFactor: 0.5,
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                SvgPicture.asset(
                  "assets/svg/background.svg",
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Icon(Icons.arrow_back),
                          ),
                          const SizedBox(
                            width: 110,
                          ),
                          SvgPicture.asset("assets/svg/logo.svg"),
                          const Text(""),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 80 , top: 15),
                        child: TextApp.topHadithScreen,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                SvgPicture.asset(
                  "assets/svg/background.svg",
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
                FutureBuilder(
                    //we call the method, which is in the folder db file database.dart
                    future: MyData.getAllData(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            Hadith item = snapshot.data[index];
                            //delete one register for id
                            return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => HomeHadith(
                                        hadith: item,
                                      ),
                                    ),
                                  );
                                },
                                child: ayah(item.key, item.nameHadith));
                          },
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 300,
                            mainAxisSpacing: 16,
                            childAspectRatio: 3 / 2.59,
                          ),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
