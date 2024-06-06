import 'package:flutter/material.dart';
import 'package:gl/src/modules/home/repository.dart';
import 'package:gl/src/state/state_app.dart';

class HomeController extends ValueNotifier<StateApp> {
  HomeController(super.value, this._homeRepository);
  final HomeRepository _homeRepository;
  final ValueNotifier<StateApp> state = ValueNotifier(StateApp.start);

  Future read() async {
    state.value = StateApp.loading;
    try {
      await _homeRepository.read();
      state.value = StateApp.success;
    } catch (e) {
      state.value = StateApp.error;
    }
  }
}
