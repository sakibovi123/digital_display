import 'dart:async';

import 'package:digitaldisplay/views/screens/Login.dart';
import 'package:digitaldisplay/views/screens/SelectPackage.dart';
import 'package:flutter/material.dart';

import 'Home.dart';

class SPlashScreen extends StatefulWidget {
  const SPlashScreen({Key? key}) : super(key: key);

  @override
  State<SPlashScreen> createState() => _SPlashScreenState();
}

class _SPlashScreenState extends State<SPlashScreen> {

  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 3), () => {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context)=>const LoginScreen()))
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [Color(0xFF3f46fb), Color(0xFFfc466b)])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/splash_image.png",
              height: 300.0
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 30.0,
                  child: const Text(
                    "A digital way of displaying your Assets",
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                    ),

                  ),
                ),
                Container(
                  height: 30,
                  child: const Text(
                      "Digital Display",
                    style: TextStyle(
                      letterSpacing: 2.0
                    ),
                  ),
                ),
                Container(
                  height: 30.0,
                  child: const Text(
                    "Powered By @BetaFore",
                    style: TextStyle(
                        letterSpacing: 2.0
                    ),
                  ),
                ),

                const CircularProgressIndicator(),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
