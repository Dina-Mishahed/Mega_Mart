import 'dart:typed_data';

import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class UserModel {
  late String phone;

  late String userId, email, firstName, lastName, pic;
  bool isEmailVerified = false;

  UserModel(this.userId, this.email, this.firstName, this.lastName, this.phone,
      this.pic, this.isEmailVerified);

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map['userId'] == "") {
      return;
    }
    userId = map['userId'];
    email = map['email'];
    firstName = map['firstName'];
    lastName = map['lastName'];
    phone = map['phone'];
    pic = map['pic'];
    isEmailVerified = map['isEmailVerified'];
  }

  toJson() {
    return {
      'userId': userId,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'pic': pic,
      'isEmailVerified': isEmailVerified,
    };
  }
}
