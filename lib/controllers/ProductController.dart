import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

class ProductController with ChangeNotifier {
  LocalStorage localStorage = new LocalStorage('userToken');

  String url =
      "https://digital-display.betafore.com/api/v1/digital-display/products/";

  // getting all products
  Future<List> getProducts() async {
    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Something went Wrong!");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  // creating products

  Future<bool> createProduct(String name, String price, File image) async {
    try {
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
        notifyListeners();
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
        notifyListeners();
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
