import 'package:flutter/material.dart';
import 'package:gl/src/modules/login/repository.dart';
import 'package:gl/src/state/state_app.dart';

class LoginController extends ValueNotifier<StateApp> {
  LoginController(super.value, this._loginRepository);
  final LoginRepository _loginRepository;
  final ValueNotifier<StateApp> state = ValueNotifier(StateApp.start);

  Future read() async {
    state.value = StateApp.loading;
    try {
      state.value = StateApp.success;
    } catch (e) {
      state.value = StateApp.error;
    }
  }
}
