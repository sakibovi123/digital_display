import 'package:flutter/material.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final title = "Digital Display";

  const NavBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 60.0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(title,
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic
        ),
      ),
      elevation: 0,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
