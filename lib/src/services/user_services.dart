import 'dart:convert';

import 'package:flutter_practical/src/models/UserList.dart';
import 'package:http/http.dart' as http;

class UserServices {
  static Future<UserList> getUserList() async {
    final response = await http.get(Uri.parse("https://dummyjson.com/users"));

    if (response.statusCode == 200) {
      return UserList.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error");
    }
  }
}
