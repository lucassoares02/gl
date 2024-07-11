import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginRepository {
  Future auth(String email, String password) async {
    try {
      var a = await http.post(
        Uri.parse("http://localhost:5115/api/Usuario/login"),
        body: jsonEncode({"email": email, "senha": password}),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
      );
      return a;
    } catch (e) {
      debugPrint("Login Repository (Read) Error: $e");
    }
  }
}
