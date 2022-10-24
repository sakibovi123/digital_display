import 'package:digitaldisplay/views/widgets/NavBar.dart';
import 'package:flutter/material.dart';

import '../widgets/Package.dart';

class PackageSelection extends StatefulWidget {
  const PackageSelection({Key? key}) : super(key: key);

  @override
  State<PackageSelection> createState() => _PackageSelectionState();
}

class _PackageSelectionState extends State<PackageSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFe9e9ff),
      appBar: AppBar(
        title: const Text(
          "Digital Display",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: Color(0xFF111111),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFe9e9ff),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Package(),
          Package(),
          Package(),
        ],
      ),
    );
  }
}
