import 'dart:developer';

import 'package:digitaldisplay/models/ProductModel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

class ProductController with ChangeNotifier {
  LocalStorage localStorage = LocalStorage('access');
  List<ProductModel> _products = [];

  Future<bool> getProducts() async {
    var url = Uri.parse(
        "https://digital-display.betafore.com/api/v1/digital-display/products/");

    var token = localStorage.getItem('access');
    try {
      http.Response response =
          await http.get(url, headers: {"Authorization": "Bearer $token"});
      // if (response.statusCode == 200) {
      print(token);
      var data = json.decode(response.body);
      List<ProductModel> temp = [];
      ProductModel productModel = ProductModel.fromJson(data);
      temp.add(productModel);
      print("Product Length =>> ${temp[0].results?.length}");
      _products = temp;
      notifyListeners();
      return true;
      // } else {
      //   return false;
      // }
    } catch (exception) {
      log(exception.toString());
      return false;
    }
  }

  List<ProductModel> get products {
    return [..._products];
  }

  Results productDetails(int id) {
    return _products[0].results!.firstWhere((element) => element.id == id);
  }

  // creating products

  Future<bool> createProduct(String name, String price, File image) async {
    try {
      var url =
          "https://digital-display.betafore.com/api/v1/digital-display/products/";
      Dio dio = Dio();
      var token = localStorage.getItem("access");
      FormData formData = FormData.fromMap({
        "name": name,
        "price": price,
        "image": await MultipartFile.fromFile(image.path)
      });
      var response = await dio.post(url,
          data: formData,
          options: Options(headers: {"Authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        print(response);

        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Editing Product

  Future<bool> editProduct(String name, String price, File image) async {
    try {
      var url =
          "https://digital-display.betafore.com/api/v1/digital-display/products/";
      Dio dio = Dio();
      var token = localStorage.getItem("access");
      FormData formData = FormData.fromMap({
        "name": name,
        "price": price,
        "image": await MultipartFile.fromFile(image.path)
      });
      var response = await dio.post(url,
          data: formData,
          options: Options(headers: {"Authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        print(response);

        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

// deleting products

  Future deleteProduct(int productId) async {
    var url =
        "https://digital-display.betafore.com/api/v1/digital-display/products/";
    Dio dio = Dio();
    var token = localStorage.getItem("access");

    var response = await dio.delete(url,
        options: Options(headers: {
          "Authorization": "Bearer $token",
        }));

    if (response.statusCode == 200) {
      return response;
    } else {
      return Future.error("Delete Request Failed!");
    }
  }
}
