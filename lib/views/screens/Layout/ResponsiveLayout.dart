import 'package:digitaldisplay/views/dimensions.dart';
import 'package:flutter/material.dart';

class ResponsiveLayoutBuilder extends StatelessWidget {
  static const routeName = "/responsive-layout";

  final Widget mobileBody;
  final Widget tvBody;

  const ResponsiveLayoutBuilder(
      {required this.mobileBody, required this.tvBody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < mobileWidth) {
        return mobileBody;
      } else {
        return tvBody;
      }
    });
  }
}
