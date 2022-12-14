import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget tvBody;
  const ProductResponsiveLayout(
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
