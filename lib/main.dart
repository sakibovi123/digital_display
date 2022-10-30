import 'package:digitaldisplay/controllers/DisplayController.dart';
import 'package:digitaldisplay/controllers/UserController.dart';
import 'package:digitaldisplay/views/screens/CreateDisplay.dart';
import 'package:digitaldisplay/views/screens/CreateProduct.dart';
import 'package:digitaldisplay/views/screens/Home.dart';
import 'package:digitaldisplay/views/screens/Login.dart';
import 'package:digitaldisplay/views/screens/Splash.dart';
import 'package:digitaldisplay/views/widgets/Package.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => UserController()),
        ChangeNotifierProvider(create: (ctx) => DisplayController()),
      ],
      child: MaterialApp(
        title: 'Digital Display',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginScreen(),
        routes: {
          Home.routeName: (context) => const Home(),
          LoginScreen.routeName: (context) => const LoginScreen(),
          CreateDisplay.routeName: (context) => const CreateDisplay(),
          CreateProduct.routeName: (context) => const CreateProduct(),
        },
      ),
    );
  }
}
