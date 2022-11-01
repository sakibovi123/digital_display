import 'dart:convert';
import 'dart:html';
import 'package:digitaldisplay/models/DisplayModel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'package:dio/dio.dart';

class DisplayController with ChangeNotifier {
  String url =
      "https://digital-display.betafore.com/api/v1/digital-display/displays/";
  LocalStorage localStorage = new LocalStorage('access');

  List<DisplayModel> _displays = [];

  Future<bool> getDisplays() async {
    var url = Uri.parse(
        "https://digital-display.betafore.com/api/v1/digital-display/displays/");
    var token = localStorage.getItem('access');

    try {
      http.Response response = await http.get(url);
      var data = json.decode(response.body) as List;
      print(data);
      List<DisplayModel> temp = [];
      data.forEach((element) {
        //DisplayModel displayModel = DisplayModel.fromJson(element);
        //temp.add(displayModel);
      });
      _displays = temp;
      notifyListeners();
      return true;
    } catch (exception) {
      return false;
    }
  }

  List<DisplayModel> get dispays {
    return [..._displays];
  }

  // Future createDisplay(String name, String category, String templateName,
  //     String productId) async {
  //   try {
  //     Dio dio = new Dio();
  //     FormData formData = FormData.fromMap({
  //       "name": name,
  //       "category": category,
  //       "template_name": templateName,
  //       "products[0]": productId
  //     });
  //     dio.options.headers["Authorization"] =
  //         "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjY3MzIzNTc4LCJpYXQiOjE2NjcyMzcxNzgsImp0aSI6ImZkMzFiZmY1MjNhZjQyMjI5OTFjNDE4OTQ1MzM2YmY5IiwiaWQiOjV9.dJLANrLLojUOCu3MoNHgPGZELz8Br1ls44It7VB46tc";
  //     var response = await Dio().post(url, data: formData);

  //     if (response.statusCode == 200) {
  //       print(response.data);

  //       notifyListeners();
  //     } else {
  //       print("ERROR VAI ERROR");
  //     }
  //   } on DioError catch (e) {
  //     print(e);
  //   }
  // }

  Future createDisplay(String name, String category, String templateName,
      String productId) async {
    var url = Uri.parse(
        "https://digital-display.betafore.com/api/v1/digital-display/displays/");
    var token = localStorage.getItem('access');
    try {
      var formdata = FormData.fromMap({
        "name": name,
        "category": category,
        "template_name": templateName,
        "products": [productId]
      });
      http.Response response =
          await http.post(url, body: json.encode(formdata), headers: {
        "Content-Type": "application/json",
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjY3MzIzNTc4LCJpYXQiOjE2NjcyMzcxNzgsImp0aSI6ImZkMzFiZmY1MjNhZjQyMjI5OTFjNDE4OTQ1MzM2YmY5IiwiaWQiOjV9.dJLANrLLojUOCu3MoNHgPGZELz8Br1ls44It7VB46tc'
      });
      var data = json.decode(response.body) as FormData;
      if (response.statusCode == 200) {
        print(response.body);
      } else {
        return Future.error("Code Problem");
      }
    } catch (exception) {
      Future.error("Something is wrong with the codes");
      return false;
    }
  }

  Future<void> deleteDisplay(int id) async {
    var url = Uri.parse(
        "https://digital-display.betafore.com/api/v1/digital-display/displays/");
    var token = localStorage.getItem('access');
    try {
      http.Response response = await http.post(url,
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
