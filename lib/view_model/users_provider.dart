import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/users_model.dart';

class UsersProvider extends ChangeNotifier {
  static const apiUrl = 'https://jsonplaceholder.typicode.com/users';

  List<Users> usersList = [];
  bool get isLoading => usersList.isEmpty;

  Future<void> getData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        usersList = data.map((userJson) => Users.fromJson(userJson)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error: $error');
      }
    }
  }
}
