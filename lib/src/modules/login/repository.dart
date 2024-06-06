import 'package:flutter/material.dart';

class LoginRepository {
  Future read() async {
    try {} catch (e) {
      debugPrint("Login Repository (Read) Error: $e");
    }
  }
}
