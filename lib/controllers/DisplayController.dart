import 'dart:convert';
import 'dart:html';
import 'package:digitaldisplay/models/DisplayModel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

class DisplayController with ChangeNotifier {
  LocalStorage localStorage = new LocalStorage('userToken');

  List<DisplayModel> _displays = [];

  Future<bool> getDisplays() async {
    var url = Uri.parse(
        "https://digital-display.betafore.com/api/v1/digital-display/displays/");
    var token = localStorage.getItem('token');

    try {
      http.Response response = await http.get(url);
      var data = json.decode(response.body) as List;
      print(data);
      List<DisplayModel> temp = [];
      data.forEach((element) {
        DisplayModel displayModel = DisplayModel.fromJson(element);
        temp.add(displayModel);
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
      String catalogImage, String video) async {
    var url = Uri.parse(
        "https://digital-display.betafore.com/api/v1/digital-display/displays/");
    var token = localStorage.getItem('token');

    try {
      http.Response response = await http.post(url,
          body: json.encode({
            "name": name,
            "category": category,
            "template_name": templateName,
            "catalogs[0]image": catalogImage,
            "catalogs[0]video": video,
          }));
      var data = json.encode(response.body) as FormData;

      return true;
    } catch (exception) {
      return false;
    }
  }
}
