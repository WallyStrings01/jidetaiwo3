import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/model/property_model.dart';

class PropertyProvider extends ChangeNotifier {
  final List<Property> _propertiesData = [
    Property(
      imageUrl: 'assets/images/landproperty.png',
      description: 'A Three (3) bedroom bungalow with mini 3 bedroom bungalow fenced round with gate, built on one full plot of land',
      officeId: 'SL|ILO|206|37|1', 
      location: 'ilorin', 
      branch: 'ilorin branch', 
      price: 16000, 
      contract: 'sale', 
      numberOfRooms: 3, 
      status: 'available', 
      area: 450, 
      numberOfBathrooms: 4, 
      numberOfViews: 5, 
      balcony: true, 
      parking: true)
  ];

  List<Property> get getPropertiesData {
    return [..._propertiesData];
  }
}
