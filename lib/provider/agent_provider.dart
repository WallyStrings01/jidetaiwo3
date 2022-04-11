import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/model/agent_model.dart';

class Agentprovider extends ChangeNotifier {
  Agent? _agent;

  Agent get getAgent {
    return _agent!;
  }

  Future<String> loginUser(String id, String phoneNumber) async {
    const url = 'https://jidetaiwoandco.com/mytest/api/post/agentsdb.php';
    try {
      HttpClient httpClient = HttpClient();
      HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
      request.headers.set('Content-type', 'application/json');
      HttpClientResponse response = await request.close();
      String reply = await response.transform(utf8.decoder).join();
      var extractedData = json.decode(reply) as List<dynamic>;
      httpClient.close();
      final agentDetails = extractedData.firstWhere(
          (element) =>
              element['clientid'] == id &&
              element['clientmobilenumber'] == phoneNumber,
          orElse: () => null);
      if (agentDetails == null) {
        throw const HttpException('Incorrect login credentials');
      }
      _agent = Agent(
          clientId: agentDetails['clientid'],
          clientName: agentDetails['clientname'],
          branchIncharge: agentDetails['branchincharge'],
          clientMobileNumber: agentDetails['clientmobilenumber'],
          clientEmail: agentDetails['clientemail'],
          clientCategory: agentDetails['clientcategory'],
          clientAddress: agentDetails['clientaddress'],
          clientDistrict: agentDetails['clientdistrict'],
          clientState: agentDetails['clientstate']);
      notifyListeners();
      return agentDetails['clientid'];
    } catch (error) {
      rethrow;
    }
  }

  Future<void> signupUser(Agent client) async {
    const url = '';
    try {} catch (error) {
      rethrow;
    }
    notifyListeners();
  }

  Future<void> updateUser(Agent client) async {
    const url = '';
    try {} catch (error) {
      rethrow;
    }
    notifyListeners();
  }
}
