import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meetmax/data/users.dart';
import 'package:meetmax/model/event_model.dart';
import 'package:meetmax/model/user_model.dart';

import '../../model/post_model.dart';

class PostController extends GetxController {

  Stream<List> getPosts() async* {
    final String response = await rootBundle.loadString('assets/files/posts.json');
    final data = await json.decode(response);
    List userPosts = data['posts'].map((data) => Post.fromJson(data)).toList();
    yield userPosts;
  }

  Future<Map<String, dynamic>> addPost(
      String caption, List<String> media, String visibility) async {
    try {
      User currentUser = User.fromJson(UserData().currentUser);

      Post post = Post(
        id: 10,
        author: currentUser.name,
        avatar: currentUser.photo!,
        time: DateFormat("dd-MM-yyyy h:mm a").format(DateTime.now()),
        visibility: visibility,
      );
      // Call API and pass add data.
      return {"status": "success", "message": "You post is added successfully"};
    } catch (e) {
      return {"status": "failed", "message": e.toString()};
    }
  }

  Future<Map<String, dynamic>> addLike(int postID) async {
    try {
      // Call API and provide post ID to increment like by 1.
      return {"status": "success", "message": "Like added successfully"};
    } catch (e) {
      return {"status": "failed", "message": e.toString()};
    }
  }

  Future<Map<String, dynamic>> addComment(PostComment comment, int postID) async {
    try {
      // Call API and provide post ID to add Comment.
      return {"status": "success", "message": "Comment added successfully"};
    } catch (e) {
      return {"status": "failed", "message": e.toString()};
    }
  }

  Future<Map<String, dynamic>> addReply(int postID, PostComment comment) async {
    try {
      // Call API and provide post ID to add Comment.
      return {"status": "success", "message": "Reply added successfully"};
    } catch (e) {
      return {"status": "failed", "message": e.toString()};
    }
  }

  Future<Map<String, dynamic>> addShare(int postID) async {
    try {
      // Call API and provide post ID to add Comment.
      return {"status": "success", "message": "Post shared successfully"};
    } catch (e) {
      return {"status": "failed", "message": e.toString()};
    }
  }

  Future<List<dynamic>> getEvents() async {
    final String response = await rootBundle.loadString('assets/files/events.json');
    final data = await json.decode(response);
    List events = data['events'].map((data) => Event.fromJson(data)).toList();
    return events;
  }

// Future<Map<String, dynamic>> addComment() async {
//
// }
}
