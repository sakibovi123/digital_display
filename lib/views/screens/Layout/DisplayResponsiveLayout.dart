import 'package:digitaldisplay/views/dimensions.dart';
import 'package:digitaldisplay/views/screens/Responsive/CreateDisplayMobile.dart';
import 'package:digitaldisplay/views/screens/Tv/CreateDisplayTv.dart';
import 'package:flutter/material.dart';

class DisplayResponsiveLayout extends StatelessWidget {
  static const routeName = "/create-display";

  final Widget mobileDisplayCreate;
  final Widget tvDesplayCreate;
  const DisplayResponsiveLayout(
      {required this.mobileDisplayCreate, required this.tvDesplayCreate});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, contraints) {
        if (contraints.maxWidth < mobileWidth) {
          return const CreateDisplayMobile();
        } else {
          return const CreateDisplayTv();
        }
      },
    );
  }
}
