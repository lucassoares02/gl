import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class DetailsRepository {
  Future read() async {
    try {} catch (e) {
      debugPrint("Login Repository (Read) Error: $e");
    }
  }

  Future update(int status, int id) async {
    try {
      var response = await http.post(
        Uri.parse("http://localhost:5115/api/Agendamento/aplicar-decisao"),
        body: jsonEncode({"id": id, "decisao": status == 1 ? "Confirmar" : "Cancelar"}),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
      );
      return response.body;
    } catch (e) {
      debugPrint("Home Repository (Find) Error: $e");
    }
  }
}
