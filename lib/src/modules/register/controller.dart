import 'package:flutter/material.dart';
import 'package:gl/src/modules/register/repository.dart';
import 'package:gl/src/state/state_app.dart';

class RegisterController extends ValueNotifier<StateApp> {
  RegisterController(super.value, this._registerRepository);
  final RegisterRepository _registerRepository;
  final ValueNotifier<StateApp> stateCreate = ValueNotifier(StateApp.start);

  Future create(String email, String password) async {
    stateCreate.value = StateApp.loading;
    try {
      await _registerRepository.insert(email, password);
      stateCreate.value = StateApp.success;
    } catch (e) {
      stateCreate.value = StateApp.error;
    }
  }
}
