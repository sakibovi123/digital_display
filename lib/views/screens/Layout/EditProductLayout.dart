import 'package:digitaldisplay/views/screens/Mobile/EditProductMobile.dart';
import 'package:digitaldisplay/views/screens/Tv/EditProductTv.dart';
import 'package:flutter/cupertino.dart';

class EditProductLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget tvBody;

  const EditProductLayout({required this.mobileBody, required this.tvBody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return const EditProductMobile();
      } else {
        return const EditProductTv();
      }
    });
  }
}
