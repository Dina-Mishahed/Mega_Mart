import 'package:get/get.dart';

validInput(String val, String type) {
  final validCharacters1 = RegExp(r'^[a-zA-Z0-9]');
  final validCharacters2 = RegExp(r'^[a-zA-Z0-9&%=]+$');
  if (val.isEmpty) {
    return "* field can't be empty";
  }
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "* please enter a valid username";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "* please enter a valid email";
    }
  }
  if (type == "phone") {
    String x = GetUtils.isPhoneNumber(val).toString();
    if (!GetUtils.isPhoneNumber(val)) {
      print("$x");
      return "* please enter a valid phone number";
    }
  }
  if (type == "password") {
    if (val.length < 6) {
      return "* please enter a password at least 6 digits";
    } else if (!val.contains(new RegExp(r'[a-z]'))) {
      return "* please enter a password contains digits and numbers";
    } else if (!val.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return "*  password can not contains special characters (&,*,%,..)";
    }
  }
}
