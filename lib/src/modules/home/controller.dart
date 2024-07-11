import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gl/src/modules/home/model.dart';
import 'package:gl/src/modules/home/repository.dart';
import 'package:gl/src/state/state_app.dart';

class HomeController extends ValueNotifier<StateApp> {
  HomeController(super.value, this._homeRepository);
  final HomeRepository _homeRepository;
  final ValueNotifier<StateApp> state = ValueNotifier(StateApp.start);
  List<Schedules> schedules = [];

  Future find() async {
    state.value = StateApp.loading;
    try {
      schedules = await _homeRepository.find();
      inspect(schedules);

      state.value = StateApp.success;
    } catch (e) {
      state.value = StateApp.error;
    }
  }
}
