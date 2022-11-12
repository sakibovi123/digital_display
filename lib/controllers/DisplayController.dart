import 'dart:convert';
import 'dart:developer';
import 'package:digitaldisplay/models/DisplayModel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'package:dio/dio.dart';
import 'dart:io';

class DisplayController with ChangeNotifier {
  String url =
      "https://digital-display.betafore.com/api/v1/digital-display/displays/";
  LocalStorage localStorage = LocalStorage('access');

  List<DisplayModel> _displays = [];

  Future<bool> getDisplays() async {
    var url = Uri.parse(
        "https://digital-display.betafore.com/api/v1/digital-display/displays/");
    var token = localStorage.getItem('access');

    try {
      http.Response response = await http.get(url, headers: {
        "Authorization":
            "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjY4MzAzMzM5LCJpYXQiOjE2NjgyMTY5MzksImp0aSI6IjMzMGI5M2FmNDdmYTQ0NTc4NWZhMDM0N2MxMzg5ZTMyIiwiaWQiOjV9.f9CSTG9O6lpi9KhuJJY1Fv9S5PBQ34yRqop6WEqx1oE"
        // "Authorization": "Bearer $token"
      });
      var data = json.decode(response.body);

      List<DisplayModel> temp = [];

      DisplayModel displayModel = DisplayModel.fromJson(data);
      temp.add(displayModel);
      print("length = ${temp[0].results?.length}");

      _displays = temp;
      notifyListeners();
      print(response);
      return true;
    } catch (exception) {
      log(exception.toString());
      return false;
    }
  }

  List<DisplayModel> get displays {
    return [..._displays];
  }

  // DisplayModel singleDisplay(int id) {
  //   return _displays.firstWhere((element) => element.results![0].id == id);
  // }
  Results singleDisplay(int id) {
    return _displays[0].results!.firstWhere((element) => element.id == id);
  }

  Future<bool> addDisplay(String name, String category, String templateName,
      File catalogsImage, File catalogsVideo, List<int> productIds) async {
    try {
      // String fileName = catalogsImage.path.split('/').last;
      var token = localStorage.getItem('access');
      Dio dio = Dio();
      FormData formData = FormData.fromMap({
        "name": name,
        "category": category,
        "template_name": templateName,
        "catalogs[0]image": await MultipartFile.fromFile(catalogsImage.path),
        "catalogs[0]video": await MultipartFile.fromFile(catalogsVideo.path),
        "products": productIds
      });

      var response = await dio.post(url,
          data: formData,
          // options: Options(headers: {"Authorization": "Bearer $token"}));
          options: Options(headers: {
            "Authorization":
                "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjY4MzAzMzM5LCJpYXQiOjE2NjgyMTY5MzksImp0aSI6IjMzMGI5M2FmNDdmYTQ0NTc4NWZhMDM0N2MxMzg5ZTMyIiwiaWQiOjV9.f9CSTG9O6lpi9KhuJJY1Fv9S5PBQ34yRqop6WEqx1oE"
          }));

      if (response.statusCode == 200) {
        notifyListeners();
        print(formData);
        print(response);
        return true;
      } else {
        return false;
      }
    } on DioError catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> editDisplay(String name, String category, String templateName,
      File catalogsImage, File catalogsVideo, List<int> productId) async {
    var token = localStorage.getItem('access');
    try {
      Dio dio = new Dio();
      FormData formData = FormData.fromMap({
        "name": name,
        "category": category,
        "template_name": templateName,
        "catalogs[0]image": catalogsImage,
        "catalogs[0]video": catalogsVideo,
        "products": productId
      });
      // dio.options.headers["Authorization"] =
      //     "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjY3NTQ0MTU5LCJpYXQiOjE2Njc0NTc3NTksImp0aSI6ImY2Mjk4MjM5ZWM0ZTQzY2VhMTRkYjFlZDliMTgxZTY4IiwiaWQiOjV9.S9N23F0Qrh5aa7qJdzSAPX__0zIU-swlwBVb5ZZkM6s";
      var response = await Dio().post(url,
          data: formData,
          options: Options(headers: {"Authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        print(response);
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
