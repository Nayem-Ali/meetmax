class AppRegex {
  RegExp nameRegex = RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
  RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  RegExp passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$');

  String? nameValidation(String? nameText) {
    if (nameText!.trim().isEmpty) {
      return "Name cannot be empty!";
    } else if (nameRegex.hasMatch(nameText) == false) {
      return "Name is mal-formatted!";
    } else {
      return null;
    }
  }

  String? emailValidation(String? emailText) {
    if (emailText!.trim().isEmpty) {
      return "Email cannot be empty!";
    } else if (emailRegex.hasMatch(emailText) == false) {
      return "Email is mal-formatted";
    } else {
      return null;
    }
  }

  String? passwordValidation(String? passwordText) {

    if (passwordText!.trim().isEmpty) {

      return "Password cannot be empty!";
    } else if (passwordRegex.hasMatch(passwordText) == false) {

      return "At least one uppercase, lowercase and digit should contains \nwith length 6";
    } else {
      print("called");
      return null;
    }
  }
}
