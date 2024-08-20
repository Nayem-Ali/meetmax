
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:meetmax/model/post_model.dart';

class UserPosts{

  Future<List> getPosts() async {
    final String response = await rootBundle.loadString('assets/files/posts.json');
    final data = await json.decode(response);
    List userPosts = data['posts'].map((data) => Post.fromJson(data)).toList();
    return userPosts;
  }
}