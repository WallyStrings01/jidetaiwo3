import 'package:flutter/material.dart';

class Property {
  final String? imageUrl;
  final String? description;
  final String? officeId;
  final String? location;
  final String? branch;
  final double? price;
  final String? contract;
  final int? numberOfRooms;
  final String? status;
  final double? area;
  final int? numberOfBathrooms;
  final int? numberOfViews;
  final bool? balcony;
  final bool? parking;

  Property(
      {@required this.imageUrl,
      @required this.description,
      @required this.officeId,
      @required this.location,
      @required this.branch,
      @required this.price,
      @required this.contract,
      @required this.numberOfRooms,
      @required this.status,
      @required this.area,
      @required this.numberOfBathrooms,
      @required this.numberOfViews,
      @required this.balcony,
      @required this.parking});
}
