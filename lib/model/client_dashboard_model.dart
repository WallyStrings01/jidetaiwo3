import 'package:flutter/material.dart';

class ClientDashboard {
  final String? property;
  final String? type;
  final bool? active;
  final bool? contract;

  ClientDashboard(
      {@required this.property,
      @required this.type,
      @required this.active,
      @required this.contract});
}
