import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meetmax/data/users.dart';

import '../../model/user_model.dart';

class AuthController extends GetxController {
  final localStorage = GetStorage();

  Future<Map<String, dynamic>> signUp(User newUser) async {
    try {
      // final String response = await rootBundle.loadString('assets/files/users.json');
      // final data = await json.decode(response);
      // final users = data['users'].map((data) => User.fromJson(data)).toList();
      final users = await UserData().getUsers();

      /// TC -> O(n) | Checking For Duplicate Users
      for (User user in users) {
        if (user.email.toLowerCase() == newUser.email.toLowerCase()) {
          return {
            "status": "failed",
            "message": "User already exits",
          };
        }
      }
      newUser.uid = users.length.toString();
      users.add(newUser);
    } catch (exception) {
      return {
        "status": "failed",
        "message": exception.toString(),
      };
    }
    return {
      "status": "success",
      "message": "Greetings to Meetmax!",
    };
  }

  Future<Map<String, dynamic>> signIn(
      String emailAddress, String password, bool isRemember) async {
    try {
      // final String response = await rootBundle.loadString('assets/files/users.json');
      // final data = await json.decode(response);
      // final users = data['users'].map((e) => User.fromJson(e)).toList();
      final users = await UserData().getUsers();

      /// TC -> O(n) | Searching for user provided info availability
      for (User user in users) {
        if (user.email.toLowerCase() == emailAddress.toLowerCase() && user.password == password) {
          if (isRemember) {
            localStorage.write("email", emailAddress);
            localStorage.write('password', password);
          }

          /// To avoid repeated sign in. Save auth status as true. If the user will be logged
          /// out then it will be false.
          localStorage.write('auth_status', true);
          return {"status": "success", "message": "Welcome back to Meetmax!"};
        }
      }
    } catch (exception) {
      return {"status": "failed", "message": exception.toString()};
    }
    return {
      "status": "failed",
      "message": "Supplied credential is not matched!",
    };
  }

  Future<Map<String, dynamic>> forgetPassword(String emailAddress) async {
    try {
      // final String response = await rootBundle.loadString('assets/files/users.json');
      // final data = await json.decode(response);
      // final users = data['users'].map((e) => User.fromJson(e)).toList();
      final users = await UserData().getUsers();

      /// TC -> O(n) | Searching for user provided info availability
      for (User user in users) {
        if (user.email.toLowerCase() == emailAddress.toLowerCase()) {
          return {
            "status": "success",
            "message": "A password reset link is sent to your email",
          };
        }
      }
    } catch (exception) {
      return {
        "status": "failed",
        "message": exception.toString(),
      };
    }
    return {
      "status": "failed",
      "message": "Sorry. No account found.",
    };
  }
}
