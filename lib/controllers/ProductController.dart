import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'dart:convert';

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
    } catch (SocketException) {
      return Future.error("Error Fetching Data!");
    }
  }

  // creating products
  Future<bool> createProduct(String category, String name, String unit,
      String price, String salePrice, String badge) async {
    var url = Uri.parse(
        "https://digital-display.betafore.com/api/v1/digital-display/products/");
    try {
      
      http.Response response = await http.post(url,
          headers: {
            "Content-Type": "application/json",
          },
          body: json.encode({
            "category": category,
            "name": name,
            "unit": unit,
            "price": price,
            "sale_price": salePrice,
            // "image": image,
            "badge": badge,
          }));

      var data = json.decode(response.body) as FormData;
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (APIException) {
      print(APIException);
      return Future.error("API ERROR");
    }
  }

  // editing products

  Future<bool> editProduct(
      int productId,
      String category,
      String name,
      String unit,
      String price,
      String salePrice,
      String image,
      String badge) async {
    var url = Uri.parse(
        "https://digital-display.betafore.com/api/v1/digital-display/products/{$productId}/");
    try {
      http.Response response = await http.put(url,
          headers: {
            "Content-Type": "application/json",
          },
          body: json.encode({
            "category": category,
            "name": name,
            "unit": unit,
            "price": price,
            "sale_price": salePrice,
            "image": image,
            "badge": badge,
          }));

      var data = json.decode(response.body) as FormData;
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (APIException) {
      print(APIException);
      return Future.error("API ERROR");
    }
  }

// deleting products

  Future<void> deleteProduct(int id) async {
    var url = Uri.parse(
        "https://digital-display.betafore.com/api/v1/digital-display/displays/");
    var token = localStorage.getItem('access');
    try {
      http.Response response = await http.delete(url,
          body: json.encode({
            'id': id,
          }),
          headers: {
            "Content-Type": "application/json",
            'Authorization': "token $token"
          });
      var data = json.decode(response.body) as Map;
      print(data);
    } catch (error) {
      print(error);
    }
  }
}
