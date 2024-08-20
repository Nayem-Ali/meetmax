import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../model/user_model.dart';

class UserData {
  late List<dynamic> users;


  void addNewUser(User newUser) {
    users.add(newUser);
  }

  bool isBirthday(String date) {

    final dateFormat = DateFormat("dd-MM-yyyy");

    return date.substring(0, 5) == dateFormat.format(DateTime.now()).substring(0, 5);
  }


  Future<List> getUsers() async {
    final String response = await rootBundle.loadString('assets/files/users.json');
    final data = await json.decode(response);
    users = data['users'].map((data) => User.fromJson(data)).toList();
    return users;
  }
}
