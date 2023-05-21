// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api, body_might_complete_normally_nullable, sized_box_for_whitespace, non_constant_identifier_names, avoid_print

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:werdy/constant/color.dart';
import 'package:werdy/constant/string.dart';
import 'package:werdy/model/hadith.dart';

class LocalAudio extends StatefulWidget {
  final Hadith? hadith;
  final String? localAudioPath;

  LocalAudio({this.localAudioPath, this.hadith});

  @override
  _LocalAudio createState() => _LocalAudio();
}

class _LocalAudio extends State<LocalAudio> {
  Duration _duration = const Duration();
  Duration _position = const Duration();

  static final AudioPlayer advancedPlayer = AudioPlayer();

  //final AudioCache audioCache = AudioCache(fixedPlayer: advancedPlayer);

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    // advancedPlayer.durationHandler = (d) => setState(() {
    //       (Exception exception) => print('_loadFile => exception $exception');
    //       _duration = d;
    //     });
    //
    // advancedPlayer.positionHandler = (p) => setState(() {
    //       _position = p;
    //     });
  }

  String? localFilePath;

  Widget _tab(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Icon(Icons.add_shopping_cart,color:Colors.cyan,size: 250),
        slider(),
        Container(
          padding: const EdgeInsets.only(left: 16.0 , right: 16.0 ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children
                .map((w) =>
                    Container(padding: const EdgeInsets.all(6.0), child: w))
                .toList(),
          ),
        ),
      ],
    );
  }

  //// test
  VoidCallback? onPressedplypus() {
    // bool bol = true;
    // if (bol) {
    //   audioCache.play("path");
    //   _btn(const Icon(Icons.play_arrow), () => advancedPlayer.pause());
    // }
  }

  Widget _btn(Icon icon, VoidCallback onPressed) {
    return ButtonTheme(
      minWidth: 50.0,
      child: Container(
        width: 60,
        height: 40,
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          color: Colors.black45,
          textColor: MyColor.yellow1,
          onPressed: onPressed,
          child: icon,
        ),
      ),
    );
  }

  Widget slider() {
    return Slider(
        activeColor: MyColor.yellow1,
        inactiveColor: Colors.black45,
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            seekToSecond(value.toInt());
            value = value;
          });
        });
  }

  Widget LocalAudio(String path) {
    return _tab([
      // _btn(
      // const Icon(Icons.play_arrow),
      // () => audioCache.play(path),
      // ),
      _btn(
        const Icon(Icons.pause),
        () => advancedPlayer.pause(),
      ),
      _btn(
        const Icon(Icons.stop),
        () => advancedPlayer.stop(),
      ),
    ]);
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    advancedPlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            "assets/svg/background.svg",
            width: double.infinity,
            fit: BoxFit.contain,
          ),
          Column(
            children: [
              const SizedBox(
                height: 40,
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
                padding: EdgeInsets.only(left: 100, top: 15),
                child: TextApp.topHadithScreen,
              ),
              const SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFFFFD439),
                    ),
                    width: 250,
                    height: 250,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width / 2,
                    padding: EdgeInsets.only(left: 70, top: 50),
                    child: SvgPicture.asset(
                      "assets/svg/islamic.svg",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 150, left: 50),
                    child: TextApp.splashScreen,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 220),
                child: Text(
                  'الحديث الاول',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 150),
                child: Text(
                  'الاعمال بالنيات',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF49C649),
                    letterSpacing: 1,
                  ),
                ),
              ),
              LocalAudio(widget.localAudioPath!)
            ],
          ),
        ],
      ),
    );
  }
}
