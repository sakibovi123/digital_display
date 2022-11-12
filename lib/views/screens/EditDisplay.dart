import 'dart:io';

import 'package:digitaldisplay/controllers/DisplayController.dart';
import 'package:digitaldisplay/views/screens/Mobile/EditDisplayMobile.dart';
import 'package:digitaldisplay/views/screens/Tv/EditDisplayTv.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'Layout/EditDisplayResponsiveLayout.dart';

class EditDisplay extends StatefulWidget {
  static const routeName = "/edit-display";
  const EditDisplay({super.key});

  @override
  State<EditDisplay> createState() => _EditDisplayState();
}

class _EditDisplayState extends State<EditDisplay> {
  final ImagePicker picker = ImagePicker();

  String _name = "";
  String _category = "";
  String _templateName = "";
  File? catalogImage;
  File? _catalogVideo;
  List<int> productId = [];

  final _form = GlobalKey<FormState>();

  DisplayController displayController = DisplayController();

  void _addDisplay() async {
    var isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    bool create = await Provider.of<DisplayController>(context, listen: false)
        .editDisplay(_name, _category, _templateName, catalogImage!,
            _catalogVideo!, productId);
    if (create) {
      print(create);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Created"),
              actions: [
                ElevatedButton(
                  child: const Text("Return"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Failed to create display!"),
              actions: [
                ElevatedButton(
                  child: const Text("Return"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    final displayId = ModalRoute.of(context)!.settings.arguments;
    final display =
        Provider.of<DisplayController>(context).singleDisplay(displayId as int);

    final displayName = display.name!;
    final categoryName = display.category!;
    final templateName = display.templateName!;
    final _productId = display.products![0].id!;
    final productImage = display.products![0].image!;

    final ButtonStyle buttonStyle1 = ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFc3232a),
      shape: const StadiumBorder(),
      minimumSize: const Size(100, 50),
    );
    final ButtonStyle buttonStyle2 = ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFc3232a),
      shape: const StadiumBorder(),
      minimumSize: const Size(100, 50),
    );
    final ButtonStyle buttonStyle3 = ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF111111),
      shape: const StadiumBorder(),
      minimumSize: const Size(100, 50),
    );
    return Scaffold(
      appBar: AppBar(),
      body: const EditDisplayResponsiveLayout(
        mobileBody: EditDisplayMobile(),
        tvBody: EditDisplayTv(),
      ),
    );
  }
}
