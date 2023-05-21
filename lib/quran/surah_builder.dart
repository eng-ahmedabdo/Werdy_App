// ignore_for_file: use_key_in_widget_constructors, prefer_typing_uninitialized_variables, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:werdy/constant/constant.dart';

final ItemScrollController itemScrollController = ItemScrollController();
final ItemPositionsListener itemPositionsListener =
    ItemPositionsListener.create();


class SurahBuilder extends StatefulWidget {
  final sura;
  final arabic;
  final suraName;
  int ayah;

  SurahBuilder(
      {Key? key, this.sura, this.arabic, this.suraName, required this.ayah})
      : super(key: key);

  @override
  State<SurahBuilder> createState() => _SurahBuilderState();
}

class _SurahBuilderState extends State<SurahBuilder> {
  bool view = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => jumpToAyah());
    super.initState();
  }

  jumpToAyah() {
    if (fabIsClicked) {
      itemScrollController.scrollTo(
          index: widget.ayah,
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOutCubic);
    }
    fabIsClicked = false;
  }


  Row verseBuilder(int index, preVerses) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.arabic[index + preVerses]['aya_text'],
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: arabicFontSize,
                  fontFamily: arabicFont,
                  color: const Color.fromARGB(196, 0, 0, 0),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [],
              ),
            ],
          ),
        ),
      ],
    );
  }

  SafeArea singleSuraBuilder(lengthOfSura) {
    String fullSura = '';
    int preVerses = 0;

    if (widget.sura + 1 != 1) {
      for (int i = widget.sura - 1; i >= 0; i--) {
        preVerses = preVerses + noOfVerses[i];
      }
    }

    if (!view) {
      for (int i = 0; i < lengthOfSura; i++) {
        fullSura += (widget.arabic[i + preVerses]['aya_text']);
      }
    }

    return SafeArea(
      child: Container(
        color: const Color.fromARGB(255, 253, 251, 240),
        child: view
            ? ScrollablePositionedList.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      (index != 0) || (widget.sura == 0) || (widget.sura == 8)
                          ? const Text('')
                          : const ReturnBasmala(),
                      Container(
                        color: index % 2 != 0
                            ? const Color.fromARGB(255, 253, 251, 240)
                            : const Color.fromARGB(255, 253, 247, 230),
                        child: PopupMenuButton(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: verseBuilder(index, preVerses),
                          ),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              onTap: () {
                                saveBookMark(widget.sura + 1, index);
                              },
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.bookmark_add,
                                    color: Color.fromARGB(255, 56, 115, 59),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Share"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                itemScrollController: itemScrollController,
                itemPositionsListener: itemPositionsListener,
                itemCount: lengthOfSura,
              )
            : ListView(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            widget.sura + 1 != 1 && widget.sura + 1 != 9
                                ? const ReturnBasmala()
                                : const Text(''),
                            Padding(
                              padding:const EdgeInsets.all(8.0),
                              child: Text(
                                fullSura,
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: mushafFontSize,
                                  fontFamily: arabicFont,
                                  color:const Color.fromARGB(196, 44, 44, 44),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int lengthOfSura = noOfVerses[widget.sura];

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Tooltip(
            message: 'Mushaf Mode',
            child: TextButton(
              onPressed: () {
                setState(() {
                  view = !view;
                });
              },
              child:  const Icon(
                Icons.chrome_reader_mode,
                color: Colors.white,
              ),
            ),
          ),
          centerTitle: true,
          title: Text(
            widget.suraName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'quran',
              shadows: [
                Shadow(
                  offset: Offset(1 , 1),
                  blurRadius: 2.0,
                  color: Color.fromARGB(255, 0, 0, 0)
                ),
              ]
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 56, 115, 59),
        ),
        body: singleSuraBuilder(lengthOfSura),
      ),
    );
  }
}

class ReturnBasmala extends StatelessWidget {
  const ReturnBasmala({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Center(
          child:  Text(
            'بسم الله الرحمن الرحيم',
            style: TextStyle(
              fontFamily: 'me_quran',
              fontSize: 30
            ),
            textDirection: TextDirection.rtl,
          ),
        )
      ],
    );
  }
}
