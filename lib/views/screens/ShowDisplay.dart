import 'package:digitaldisplay/controllers/DisplayController.dart';
import 'package:digitaldisplay/models/DisplayModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowDisplay extends StatelessWidget {
  static const routeName = "/show-display";

  const ShowDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final displayId = ModalRoute.of(context)!.settings.arguments;
    final display =
        Provider.of<DisplayController>(context).singleDisplay(displayId as int);
    final displayImg = display.catalogs![0].image!;
    final productName = display.products![0].name!;
    final productImage = display.products![0].image;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Image.network(
              "https://digital-display.betafore.com/$displayImg",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.network(
                      "https://digital-display.betafore.com/$productImage",
                      height: 500,
                      width: 600),
                  Text(productName,
                      style: const TextStyle(
                        fontSize: 72,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
