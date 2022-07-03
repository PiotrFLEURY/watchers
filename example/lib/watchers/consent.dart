import 'package:flutter/material.dart';
import 'package:watchers/states/bool_state.dart';
import 'package:watchers/watchers.dart';

class Consent extends Watcher<BoolState> {
  Consent({super.key, required super.state, required super.builder});

  static Consent of(BuildContext context) => Watcher.of<Consent>(context);
}

extension ConsentExtension on BuildContext {
  bool get userConsent => Consent.of(this).state.value;

  void onUserConsentChanged(bool value) => Consent.of(this).state.value = value;
}
