import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

class UserController with ChangeNotifier {
  LocalStorage storage = new LocalStorage('access');

  Future<bool> loginNow(String email, String passw) async {
    var url = Uri.parse('https://digital-display.betafore.com/api/v1/login/');
    try {
      http.Response response = await http.post(url,
          headers: {
            "Content-Type": "application/json",
          },
          body: json.encode({"email": email, "password": passw}));
      var data = json.decode(response.body) as Map;

      if (data.containsKey("access")) {
        storage.setItem("access", data['access']);
        // ignore: avoid_print
        print(storage.getItem('access'));
        return true;
      }
      return false;
    } catch (e) {
      // ignore: avoid_print
      print("Login Exception=>");
      // ignore: avoid_print
      print(e);
      return false;
    }
  }
}
