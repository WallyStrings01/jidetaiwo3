import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/model/client_dashboard_model.dart';

class ClientDashboardProvider extends ChangeNotifier {
  final List<ClientDashboard> _clientDashboard = [
    ClientDashboard(
      property: 'Detached house', 
      type: 'Lease', 
      active: true, 
      contract: true),
    ClientDashboard(
        property: '5 bedroom house with 2 rooms BQ',
        type: 'Lease',
        active: true,
        contract: true),
    ClientDashboard(
        property: 'Detached house',
        type: 'Lease',
        active: true,
        contract: true),
    ClientDashboard(
        property: '5 bedroom house with 2 rooms BQ',
        type: 'Lease',
        active: true,
        contract: true),
  ];

  List<ClientDashboard> get getClientDashboardData {
    return [..._clientDashboard];
  }
}
