import 'package:digitaldisplay/controllers/DisplayController.dart';
import 'package:digitaldisplay/controllers/ProductController.dart';
import 'package:digitaldisplay/controllers/UserController.dart';
import 'package:digitaldisplay/views/screens/CreateDisplay.dart';
import 'package:digitaldisplay/views/screens/CreateProduct.dart';
import 'package:digitaldisplay/views/screens/EditDisplay.dart';
import 'package:digitaldisplay/views/screens/EditProduct.dart';
import 'package:digitaldisplay/views/screens/Home.dart';
import 'package:digitaldisplay/views/screens/Layout/DisplayResponsiveLayout.dart';
import 'package:digitaldisplay/views/screens/Layout/ResponsiveLayout.dart';
import 'package:digitaldisplay/views/screens/Login.dart';
import 'package:digitaldisplay/views/screens/Mobile/CreateDisplayMobile.dart';
import 'package:digitaldisplay/views/screens/Mobile/MobileBody.dart';
import 'package:digitaldisplay/views/screens/Mobile/TvBody.dart';
import 'package:digitaldisplay/views/screens/ShowDisplay.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalStorage localStorage = new LocalStorage("userToken");
    var token = localStorage.getItem("access");
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => UserController()),
        ChangeNotifierProvider(create: (ctx) => DisplayController()),
        ChangeNotifierProvider(create: (ctx) => ProductController()),
      ],
      child: MaterialApp(
        title: 'Digital Display',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: 'OpenSans',
        ),
        home: const LoginScreen(),
        // home: token != null ? const Home() : const LoginScreen(),
        routes: {
          Home.routeName: (context) => const Home(),
          MobileBody.routeName: (context) => const MobileBody(),
          LoginScreen.routeName: (context) => const LoginScreen(),
          CreateDisplay.routeName: (context) => const CreateDisplay(),
          CreateProduct.routeName: (context) => CreateProduct(),
          ShowDisplay.routeName: (context) => const ShowDisplay(),
          EditDisplay.routeName: (context) => const EditDisplay(),
          EditProduct.routeName: (context) => const EditProduct(),
          ResponsiveLayoutBuilder.routeName: (context) =>
              const ResponsiveLayoutBuilder(
                mobileBody: MobileBody(),
                tvBody: TvBody(),
              ),
          // DisplayResponsiveLayout.routeName: (context) => const DisplayResponsiveLayout(),
        },
      ),
    );
  }
}
