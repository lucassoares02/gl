import 'package:flutter/material.dart';

class HomeRepository {
  Future read() async {
    try {} catch (e) {
      debugPrint("Home Repository (Read) Error: $e");
    }
  }
}
