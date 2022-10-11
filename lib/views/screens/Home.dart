import 'package:flutter/material.dart';
import 'package:responsive_toolkit/responsive_toolkit.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFe9e9ff),
      appBar: AppBar(
        leading: const Icon(Icons.menu, color: Colors.black),
        title: const Text("Digital Display",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: Color(0xFF111111),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFe9e9ff),
        elevation: 0,
      ),
    body: ResponsiveLayout(
      Breakpoints(
        xs: const ListView.builder(itemBuilder: )

      ),
    )
    );
  }
}
