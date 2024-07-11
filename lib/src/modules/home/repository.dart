import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gl/src/modules/home/model.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  Future find() async {
    try {
      var response = await http.get(
        Uri.parse("http://localhost:5115/api/Agendamento/get-agendamentos?id=1"),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
      );
      print(response.body);
      List list = jsonDecode(response.body) as List;
      return list.map((json) => Schedules.fromJson(json)).toList();
    } catch (e) {
      debugPrint("Home Repository (Find) Error: $e");
    }
  }
}
