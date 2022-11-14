import 'dart:io';
import 'package:digitaldisplay/controllers/ProductController.dart';
import 'package:digitaldisplay/views/screens/Layout/ProductResponsivelayout.dart';
import 'package:digitaldisplay/views/screens/Mobile/CreateProductMobile.dart';
import 'package:digitaldisplay/views/screens/Tv/CreateProductTv.dart';
import 'package:digitaldisplay/views/widgets/ProductCard.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CreateProduct extends StatelessWidget {
  static const routeName = "/create-product";
  CreateProduct({super.key});

  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF111111),
        title: const Text(
          "Create Product",
          textAlign: TextAlign.end,
        ),
      ),
      body: const ProductResponsiveLayout(
          mobileBody: CreateProductMobile(), tvBody: CreateProductTv()),
    );
  }
}
