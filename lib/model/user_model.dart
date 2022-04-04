import 'package:flutter/material.dart';

class User {
  final String? id;
  final String? fullName;
  final String? mobileNumber;
  final String? emailAddress;
  final String? accountType;
  final String? address;

  User(@required this.id,
      {@required this.fullName,
      @required this.mobileNumber,
      @required this.emailAddress,
      @required this.accountType,
      @required this.address});
}
