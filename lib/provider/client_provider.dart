import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/model/client_model.dart';

class Clientprovider extends ChangeNotifier {
  Client? _client;

  Client get getClient {
    return _client!;
  }

  Future<String> loginUser(String id, String phoneNumber) async {
    const url = 'https://jidetaiwoandco.com/mytest/api/post/clientsdb.php';
    try {
      HttpClient httpClient = HttpClient();
      HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
      request.headers.set('Content-type', 'application/json');
      HttpClientResponse response = await request.close();
      String reply = await response.transform(utf8.decoder).join();
      var extractedData = json.decode(reply) as List<dynamic>;
      httpClient.close();
      final clientDetails = extractedData.firstWhere(
          (element) =>
              element['clientid'] == id &&
              element['clientmobilenumber'] == phoneNumber,
          orElse: () => null);
      if (clientDetails == null) {
        throw const HttpException('Incorrect login credentials');
      }
      _client = Client(
          clientId: clientDetails['clientid'],
          clientName: clientDetails['clientname'],
          phoneNumber: clientDetails['clientmobilenumber'],
          emailAddress: clientDetails['clientemail'],
          clientCategory: clientDetails['clientcategory'],
          clientAddress: clientDetails['clientaddress'],
          clientDistrict: clientDetails['clientdistrict'],
          clientState: clientDetails['clientstate']);
      notifyListeners();
      return clientDetails['clientid'];
    } catch (error) {
      rethrow;
    }
  }

  Future<void> signupUser(Client client) async {
    const url = '';
    try {} catch (error) {
      rethrow;
    }
    notifyListeners();
  }

  Future<void> updateUser(Client client) async {
    const url = '';
    try {} catch (error) {
      rethrow;
    }
    notifyListeners();
  }
}
