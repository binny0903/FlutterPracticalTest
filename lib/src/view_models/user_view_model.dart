import 'package:flutter/material.dart';
import 'package:flutter_practical/src/models/UserList.dart';
import 'package:flutter_practical/src/services/user_services.dart';

class UserViewModel extends ChangeNotifier {
   UserList? userList;
  //  List<Users>? userList;

  Future<void> fetchUsers() async {
    userList = await UserServices.getUserList();
    notifyListeners();
  }
}
