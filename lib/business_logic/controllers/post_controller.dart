
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../model/post_model.dart';

class PostController extends GetxController{
  Stream<List> getPosts() async* {
    final String response = await rootBundle.loadString('assets/files/posts.json');
    final data = await json.decode(response);
    List userPosts = data['posts'].map((data) => Post.fromJson(data)).toList();
    yield userPosts;
  }

  // Future<Map<String, dynamic>> addComment() async {
  //
  // }


}