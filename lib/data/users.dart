import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../model/user_model.dart';

class UserData {

  Map<String, dynamic> currentUser = {
    "name": "Nayem Ali",
    "email": "nayemacademic14@gmail.com",
    "uid": "1",
    "dob": "20-08-1999",
    "gender": "male",
    "password": "Nayem123",
    "photo": "assets/images/Profile.png"
  };



  bool isBirthday(String date) {

    final dateFormat = DateFormat("dd-MM-yyyy");

    return date.substring(0, 5) == dateFormat.format(DateTime.now()).substring(0, 5);
  }


  Future<List> getUsers() async {
    final String response = await rootBundle.loadString('assets/files/users.json');
    final data = await json.decode(response);
    final users = data['users'].map((data) => User.fromJson(data)).toList();
    return users;
  }
}
