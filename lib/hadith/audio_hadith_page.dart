// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:werdy/constant/color.dart';
import 'package:werdy/constant/string.dart';
import 'package:werdy/db/data.dart';
import 'package:werdy/hadith/local_audio.dart';
import 'package:werdy/model/hadith.dart';

class AudioHadithPage extends StatefulWidget {
  @override
  State<AudioHadithPage> createState() => _AudioHadithPageState();
}

class _AudioHadithPageState extends State<AudioHadithPage> {
  @override
  Widget build(BuildContext context) {
    Widget ayah(String key, name) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Image.asset("assets/img.png"),
          SvgPicture.asset("assets/svg/grey.svg"),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                key,
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
                Column(
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
                    Padding(
                      padding: EdgeInsets.only(left: 140, top: 15),
                      child: TextApp.topListenScreen,
                    ),
                  ],
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
                  fit: BoxFit.cover,
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
                                      builder: (context) => LocalAudio(
                                        hadith: item,
                                        localAudioPath:
                                            'audio/${item.audioHadith}',
                                      ),
                                    ),
                                  );
                                },
                                child: ayah(item.key!, item.nameHadith));
                          },
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 300,
                            mainAxisSpacing: 16,
                            childAspectRatio: 3 / 2.29,
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
/*
 ListView.builder(
              // physics: BouncingScrollPhysics(),
              //Count all records

              itemCount: snapshot.data.length,
              //all the records that are in the Operation table are passed to an item Operation item = snapshot.data [index];
              itemBuilder: (BuildContext context, int index) {
                Hadith item = snapshot.data[index];
                //delete one register for id
                return ayah(item.key, item.nameHadith);

              },
            );
 */
/*
Card(
                  margin: EdgeInsets.all(3.0),
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0))),
                  child: ListTile(

                    title:
                    RichText(
                      textAlign: TextAlign.right,

                      text: TextSpan(
                          style:TextStyle(fontSize:20,color: Colors.teal),
                          children: [
                            TextSpan(text: item.key+': ' , style: TextStyle(color: Colors.brown)),
                            TextSpan(text: item.nameHadith ,style: TextStyle(color: Colors.deepOrange))]
                      ),
                      textDirection: TextDirection.rtl,
                    ),

                    subtitle: Text(item.textHadith.substring(0,120) +'...', textDirection: TextDirection.rtl,),
                    trailing:Icon(Icons.library_books,color: Colors.brown,) ,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                          //HadithPage(hadith: item,)
                          HomeHadith(hadith: item,)
                      ));
                    },
                  ),
                );
 */
