import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterRepository {
  final Dio dio = Dio();

  Future insert(String email, String password) async {
    dio.options.contentType = Headers.jsonContentType;

    try {
      // Response response = await dio.post("http://localhost:5115/api/Usuario/cadastrar-usuario", data: {"email": email, "senha": password});
      var a = await http.post(
        Uri.parse("http://localhost:5115/api/Usuario/cadastrar-usuario"),
        body: jsonEncode({"email": email, "senha": password}),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
      );
    } catch (e) {
      debugPrint("Register Repository (Read) Error: $e");
    }
  }
}
