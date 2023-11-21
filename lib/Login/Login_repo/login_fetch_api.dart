import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Login_UI/login.dart';


login(String username, String password, BuildContext context) async {

  const String apiUrl = 'https://dummyjson.com/auth/login';
  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'username': username,
        'password': password,
      },
    );

    if (kDebugMode) {
      print(response);
    }

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data['token'];
      await saveToken(token);

      if (kDebugMode) {
        print('Login Successful: $data');
        print(response.statusCode);
        Navigator.pushReplacementNamed(context, '/home');
      }

    } else {
      if (kDebugMode) {
        print(response.statusCode);
        print('Login Error: ${response.statusCode}');
      }

    }
  } catch (e) {

    if (kDebugMode) {
      print('Network Error: $e');
    }
  }
}