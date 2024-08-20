class AppRegex {
  RegExp nameRegex = RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
  RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  RegExp passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$');
  RegExp dobRegex = RegExp(r"^(0[1-9]|[12][0-9]|3[01])-(0[1-9]|1[0-2])-([1-2]\d{3})$");

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
      return null;
    }
  }

  String? dobValidation(String? dobDate){
    if(dobDate!.trim().isEmpty){
      return "Please provide Date of Birth";
    } else if(dobRegex.hasMatch(dobDate) == false){
      return "Date of birth format should be DD-MM-YYYY";
    }
    else {
      return null;
    }
  }
}
