// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:werdy/hadith/main_page.dart';
import 'package:werdy/quran/index_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Werdy وردي",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image(
              image: AssetImage('assets/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 60,
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.height / 3.3,
              child: Image(
                image: AssetImage('assets/صلي علي محمد.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 205, right: 10, left: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (ctx) => IndexPage()));
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          // boxShadow: [
                          //   BoxShadow(blurRadius: 10.0, offset: Offset(0, 5)),
                          // ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: MediaQuery.of(context).size.height / 3.5,
                      ),
                      Positioned(
                        top: 15,
                        left: 150,
                        child: Image(
                          width: 180,
                          height: 180,
                          image: AssetImage('assets/Quran.png'),
                        ),
                      ),
                      Positioned(
                        top: 60,
                        left: 10,
                        child: Text(
                          " Quran\nKareem",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(right: 10, left: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => MainPage(),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green[800],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: MediaQuery.of(context).size.height / 3.5,
                      ),
                      Positioned(
                        top: 5,
                        left: 150,
                        child: Image(
                          width: 200,
                          height: 200,
                          image: AssetImage('assets/Hadeth.png'),
                        ),
                      ),
                      Positioned(
                        top: 60,
                        left: 10,
                        child: Text(
                          "Hadith\nShreef",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
