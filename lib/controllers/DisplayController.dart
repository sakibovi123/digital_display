import 'dart:convert';
import 'package:digitaldisplay/models/DisplayModel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'package:dio/dio.dart';
import 'dart:io';

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

  Future<bool> addDisplay(String name, String category, String templateName,
      File catalogsImage, String catalogsVideo, int productId) async {
    try {
      // String fileName = catalogsImage.path.split('/').last;
      Dio dio = new Dio();
      FormData formData = FormData.fromMap({
        "name": name,
        "category": category,
        "template_name": templateName,
        "catalogs[0]image": await MultipartFile.fromFile(catalogsImage.path),
        "catalogs[0]video": catalogsVideo,
        "products[0]": productId
      });
      // dio.options.headers["Authorization"] =
      //     "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjY3NTQ0MTU5LCJpYXQiOjE2Njc0NTc3NTksImp0aSI6ImY2Mjk4MjM5ZWM0ZTQzY2VhMTRkYjFlZDliMTgxZTY4IiwiaWQiOjV9.S9N23F0Qrh5aa7qJdzSAPX__0zIU-swlwBVb5ZZkM6s";
      var response = await Dio().post(url,
          data: formData,
          options: Options(headers: {
            "Authorization":
                "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjY3NTQ0MTU5LCJpYXQiOjE2Njc0NTc3NTksImp0aSI6ImY2Mjk4MjM5ZWM0ZTQzY2VhMTRkYjFlZDliMTgxZTY4IiwiaWQiOjV9.S9N23F0Qrh5aa7qJdzSAPX__0zIU-swlwBVb5ZZkM6s"
          }));

      if (response.statusCode == 200) {
        print(response.data);
        notifyListeners();
        return true;
      } else {
        print("ERROR VAI ERROR");
        return false;
      }
    } on DioError catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> editDisplay(String name, String category, String templateName,
      String catalogsImage, String catalogsVideo, int productId) async {
    try {
      Dio dio = new Dio();
      FormData formData = FormData.fromMap({
        "name": name,
        "category": category,
        "template_name": templateName,
        "catalogs[0]image": catalogsImage,
        "catalogs[0]video": catalogsVideo,
        "products[0]": productId
      });
      // dio.options.headers["Authorization"] =
      //     "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjY3NTQ0MTU5LCJpYXQiOjE2Njc0NTc3NTksImp0aSI6ImY2Mjk4MjM5ZWM0ZTQzY2VhMTRkYjFlZDliMTgxZTY4IiwiaWQiOjV9.S9N23F0Qrh5aa7qJdzSAPX__0zIU-swlwBVb5ZZkM6s";
      var response = await Dio().post(url,
          data: formData,
          options: Options(headers: {
            "Authorization":
                "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjY3NTQ0MTU5LCJpYXQiOjE2Njc0NTc3NTksImp0aSI6ImY2Mjk4MjM5ZWM0ZTQzY2VhMTRkYjFlZDliMTgxZTY4IiwiaWQiOjV9.S9N23F0Qrh5aa7qJdzSAPX__0zIU-swlwBVb5ZZkM6s"
          }));

      if (response.statusCode == 200) {
        print(response.data);
        notifyListeners();
        return true;
      } else {
        print("ERROR VAI ERROR");
        return false;
      }
    } on DioError catch (e) {
      print(e);
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
