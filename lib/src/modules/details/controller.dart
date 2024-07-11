import 'package:flutter/material.dart';
import 'package:gl/src/modules/details/repository.dart';
import 'package:gl/src/state/state_app.dart';

class DetailsController extends ValueNotifier<StateApp> {
  DetailsController(super.value, this._detailsRepository);
  final DetailsRepository _detailsRepository;
  final ValueNotifier<StateApp> state = ValueNotifier(StateApp.start);

  Future read() async {
    state.value = StateApp.loading;
    try {
      await _detailsRepository.read();
      state.value = StateApp.success;
    } catch (e) {
      state.value = StateApp.error;
    }
  }

  Future update(int status, int id) async {
    state.value = StateApp.loading;
    try {
      await _detailsRepository.update(status, id);
      state.value = StateApp.success;
    } catch (e) {
      state.value = StateApp.error;
    }
  }
}
