import 'package:flutter/material.dart';

class EditDisplayResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget tvBody;

  const EditDisplayResponsiveLayout(
      {required this.mobileBody, required this.tvBody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return mobileBody;
      } else {
        return tvBody;
      }
    });
  }
}
