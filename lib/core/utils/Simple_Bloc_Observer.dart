import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class simpleblocobserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log("State = $change");
  }

  @override
  void onClose(BlocBase bloc) {
    log("Close = $bloc");
  }

  @override
  void onCreate(BlocBase bloc) {
    log("Create = $bloc");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
  }
}
