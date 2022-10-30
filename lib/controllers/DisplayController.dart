import 'dart:convert';
import 'dart:html';
import 'package:digitaldisplay/models/DisplayModel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

class DisplayController with ChangeNotifier {
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

  Future<bool> createDisplay(String name, String category, String templateName,
      int productId) async {
    var url = Uri.parse(
        "https://digital-display.betafore.com/api/v1/digital-display/displays/");
    var token = localStorage.getItem('access');
    try {
      var formdata = new Map<String, dynamic>();
      formdata["name"] = name;
      formdata["category"] = category;
      formdata["template_name"] = templateName;
      formdata["products[0]"] = 1;
      http.Response response =
          await http.post(url, body: json.encode(formdata), headers: {
        "Content-Type": "application/json",
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjY3MjMzNjEzLCJpYXQiOjE2NjcxNDcyMTMsImp0aSI6IjgyNDg0YWYzMDdmOTQ0YjNhMTQ5ZWIzN2NkNjIzNGI4IiwiaWQiOjV9.qc9fmF4B0V6NTwxsztBb6AkF78kU_06wommCa5gLgOo'
      });
      print(response.body);
      var data = json.encode(response.body) as Map;
      print(data);
      return true;
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
