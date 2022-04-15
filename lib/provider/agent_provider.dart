import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/model/agent_model.dart';
import 'package:http/http.dart' as http;

class Agentprovider extends ChangeNotifier {
  Agent? _agent;
  String? idToken;

  Agent get getAgent {
    return _agent!;
  }

  Future<void> loginuser(String id, String phonenumber) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDb8vm8IwXfypzfIVwL3hrOqHHisz8nf-U';
    try {
      final response = await http.post(Uri.parse(url),
          body: json.encode({'email': id, 'password': phonenumber, 'returnSecureToken': true
          }));
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      idToken = responseData['idToken'];
      final extractedClientResponse = await http.get(Uri.parse(
          'https://jidetaiwo-f6ce4-default-rtdb.firebaseio.com/agents.json'));
      final extractedClientData =
          json.decode(extractedClientResponse.body) as Map<dynamic, dynamic>;
      final extractedClient = extractedClientData.values.toList().firstWhere(
          (element) => element['clientid'] == responseData['localId']);
      _agent = Agent(
          clientId: extractedClient['clientid'],
          clientName: extractedClient['clientname'],
          branchIncharge: extractedClient['branchid'],
          clientMobileNumber: extractedClient['clientmobilenumber'],
          clientEmail: extractedClient['clientemail'],
          clientCategory: extractedClient['categoryid'],
          clientAddress: extractedClient['clientaddress'],
          clientDistrict: extractedClient['clientdistrict'],
          clientState: extractedClient['clientstate']);
      notifyListeners();
    } catch (error) {
      rethrow;
    }
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

  Future<void> signupUser(Agent agent, String password) async {
    int categoryid;
    if (agent.clientCategory.toString().toLowerCase() == 'enquiry') {
      categoryid = 1;
    } else if (agent.clientCategory.toString().toLowerCase() ==
        'property owner (landlord)') {
      categoryid = 2;
    } else if (agent.clientCategory.toString().toLowerCase() ==
        'estate agent') {
      categoryid = 3;
    } else if (agent.clientCategory.toString().toLowerCase() == 'company') {
      categoryid = 4;
    } else if (agent.clientCategory.toString().toLowerCase() == 'tenant') {
      categoryid = 5;
    } else if (agent.clientCategory.toString().toLowerCase() == 'new client') {
      categoryid = 6;
    } else if (agent.clientCategory.toString().toLowerCase() ==
        'valuation client or proxy') {
      categoryid = 7;
    } else if (agent.clientCategory.toString().toLowerCase() == 'developer') {
      categoryid = 8;
    } else {
      categoryid = 0;
    }
    const url =
        'https://jidetaiwo-f6ce4-default-rtdb.firebaseio.com/agents.json';
    try {
      final response = await http.post(
          Uri.parse(
              'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDb8vm8IwXfypzfIVwL3hrOqHHisz8nf-U'),
          body: json.encode({
            'email': agent.clientEmail,
            'password': password,
            'returnSecureToken': true
          }));
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      await http.post(Uri.parse(url),
          body: json.encode({
            'clientid': responseData['localId'],
            'categoryid': categoryid.toString(),
            'branchid': '23',
            'clientemail': responseData['email'],
            'clientmobilenumber': agent.clientMobileNumber,
            'clientname': agent.clientName,
            'clientaddress': agent.clientAddress,
            'clientdistrict': 'Ikeja',
            'clientstate': 'Lagos',
            'clientstatus': 'Active'
          }));
        idToken = responseData['idToken'];
    } catch (error) {
      rethrow;
    }
    notifyListeners();
  }

  Future<void> updateUser(
      {String? name,
      String? phoneNumber,
      String? email,
      String? address}) async {
    try {
      final emailResponse = await http.post(
          Uri.parse(
              'https://identitytoolkit.googleapis.com/v1/accounts:update?key=AIzaSyDb8vm8IwXfypzfIVwL3hrOqHHisz8nf-U'),
          body: json.encode(
              {'idToken': idToken, 'email': email, 'returnSecureToken': true}));
      final emailResponseData =
          json.decode(emailResponse.body) as Map<String, dynamic>;
      if (emailResponseData['error'] != null) {
        throw HttpException(emailResponseData['error']['message']);
      }
      final extractedClientResponse = await http.get(Uri.parse(
          'https://jidetaiwo-f6ce4-default-rtdb.firebaseio.com/agents.json'));
      final extractedClientData =
          json.decode(extractedClientResponse.body) as Map<dynamic, dynamic>;
      String createdId = '';
      extractedClientData.forEach((key, value) {
        if (value['clientid'] == _agent!.clientId) {
          createdId = key;
        }
      });
      final url =
          'https://jidetaiwo-f6ce4-default-rtdb.firebaseio.com/agents/$createdId.json';
      final response = await http.patch(Uri.parse(url),
          body: json.encode({
            'clientname': name,
            'clientmobilenumber': phoneNumber,
            'clientemail': email,
            'clientaddress': address
          }));
      final responseData = json.decode(response.body) as Map;
      _agent = Agent(
          clientId: _agent!.clientId,
          clientName: responseData['clientname'],
          branchIncharge: _agent!.branchIncharge,
          clientMobileNumber: responseData['clientmobilenumber'],
          clientEmail: responseData['clientemail'],
          clientCategory: _agent!.clientCategory,
          clientAddress: responseData['clientaddress'],
          clientDistrict: _agent!.clientDistrict,
          clientState: _agent!.clientState);
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> chnagepassword(String oldpassword, String newpassword) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDb8vm8IwXfypzfIVwL3hrOqHHisz8nf-U';
    try {
      final response = await http.post(Uri.parse(url),
          body: json.encode({
            'email': _agent!.clientAddress,
            'password': oldpassword,
          }));
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      await http.post(Uri.parse(
              'https://identitytoolkit.googleapis.com/v1/accounts:update?key=AIzaSyDb8vm8IwXfypzfIVwL3hrOqHHisz8nf-U'),
          body: json.encode({
            'idToken': idToken,
            'password': newpassword,
          }));
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
