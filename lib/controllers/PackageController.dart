import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'dart:convert';
import 'dart:html';

class PackageController {
  Future<List> getPackages() async {
    var url = Uri.parse(
        "https://digital-display.betafore.com/api/v1/subscription-models/");
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error 403 Firbidden Request!");
      }
    } catch (Exception) {
      return Future.error("Error");
    }
  }
}
