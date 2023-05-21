import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:werdy/constant/color.dart';
import 'package:werdy/constant/string.dart';
import 'package:werdy/hadith/audio_hadith_page.dart';
import 'package:werdy/hadith/hadith_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            "assets/svg/background.svg",
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              SvgPicture.asset("assets/svg/logo.svg"),
              const SizedBox(height: 15,),
              Column(
                //mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextApp.topHomeScreen,
                  TextApp.headerHomeScreen,
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => HadithPage()));
                    },
                    child: myCard(
                      MyColor.primary,
                      MyColor.darkPrimary,
                      "الاحاديث الاربعين",
                      "assets/HadethShreef.png",
                      'assets/svg/one.svg',
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => AudioHadithPage(),),);
                      },
                      child: myCard(
                          MyColor.yellow1,
                          MyColor.violet,
                          "الاستماع للاحاديث",
                          "assets/play.png",
                          'assets/svg/twoo.svg')),
                  myCard(
                    MyColor.red1,
                    MyColor.violet,
                    "الاحاديث المحفوظه",
                    "assets/save-instagram.png",
                    "assets/svg/three.svg",
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

Widget myCard(
  Color color1,
  color2,
  String text,
  path1,
  path2,
) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 45),
    child: Container(
      height: 117,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, offset: Offset(10, 10), blurRadius: 40)
          ],
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
              colors: [
                color1,
                color2,
              ],
              begin: AlignmentDirectional.topEnd,
              end: AlignmentDirectional.bottomStart)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(path1),
          Text(text),
          SvgPicture.asset(path2),
        ],
      ),
    ),
  );
}
