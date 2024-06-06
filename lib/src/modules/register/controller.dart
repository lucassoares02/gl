import 'package:flutter/material.dart';
import 'package:gl/src/modules/register/repository.dart';
import 'package:gl/src/state/state_app.dart';

class RegisterController extends ValueNotifier<StateApp> {
  RegisterController(super.value, this._registerRepository);
  final RegisterRepository _registerRepository;
  final ValueNotifier<StateApp> state = ValueNotifier(StateApp.start);

  Future read() async {
    state.value = StateApp.loading;
    try {
      await _registerRepository.read();
      state.value = StateApp.success;
    } catch (e) {
      state.value = StateApp.error;
    }
  }
}
