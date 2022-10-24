import 'package:digitaldisplay/views/screens/CreateDisplay.dart';
import 'package:digitaldisplay/views/screens/Home.dart';
import 'package:digitaldisplay/views/screens/Login.dart';
import 'package:digitaldisplay/views/screens/Splash.dart';
import 'package:digitaldisplay/views/widgets/Package.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Display',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CreateDisplay(),
    );
  }
}
