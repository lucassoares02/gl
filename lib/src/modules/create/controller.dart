import 'package:flutter/material.dart';
import 'package:gl/src/modules/create/repository.dart';
import 'package:gl/src/state/state_app.dart';

class CreateController extends ValueNotifier<StateApp> {
  CreateController(super.value, this._createRepository);
  final CreateRepository _createRepository;
  final ValueNotifier<StateApp> state = ValueNotifier(StateApp.start);

  Future read() async {
    state.value = StateApp.loading;
    try {
      await _createRepository.read();
      state.value = StateApp.success;
    } catch (e) {
      state.value = StateApp.error;
    }
  }
}
