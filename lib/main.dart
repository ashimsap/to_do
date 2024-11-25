import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do/pages/homepage.dart';

void main() async{
  await Hive.initFlutter();
  var box = await Hive.openBox("mybox");
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Homepage(),
    );
  }
}