
import 'package:flutter/material.dart';
import 'package:werdy/constant/constant.dart';
import 'package:werdy/home_page.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      await readJson();
      await getSetting();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      title: 'Werdy-وردي',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}





