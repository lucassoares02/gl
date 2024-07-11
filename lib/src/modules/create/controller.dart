import 'package:flutter/material.dart';
import 'package:gl/src/modules/create/repository.dart';
import 'package:gl/src/state/state_app.dart';

class CreateController extends ValueNotifier<StateApp> {
  CreateController(super.value, this._createRepository);
  final CreateRepository _createRepository;
  final ValueNotifier<StateApp> state = ValueNotifier(StateApp.start);

  Future create(String address, String client, String service, String phone, String budget, String initDate, String endDate, String expense) async {
    state.value = StateApp.loading;
    try {
      await _createRepository.create(address, client, service, phone, budget, initDate, endDate, expense);
      state.value = StateApp.success;
    } catch (e) {
      state.value = StateApp.error;
    }
  }
}
