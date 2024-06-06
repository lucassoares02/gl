import 'package:flutter/material.dart';

class DetailsRepository {
  Future read() async {
    try {} catch (e) {
      debugPrint("Login Repository (Read) Error: $e");
    }
  }
}
