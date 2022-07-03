import 'package:example/models/user_authentication.dart';
import 'package:flutter/material.dart';
import 'package:watchers/watchers.dart';

class AuthenticationState extends GenericState<UserAuthentication> {
  AuthenticationState() : super(UserAuthentication());

  UserAuthentication get userAuthentication => value;

  set userAuthentication(auth) => value = auth;

  bool get authenticated => value.name != null;
}

class Authentication extends Watcher<AuthenticationState> {
  Authentication({Key? key, required super.state, required super.builder})
      : super(key: key);

  static Authentication of(BuildContext context) =>
      Watcher.of<Authentication>(context);
}

extension AuthenticationExtension on BuildContext {
  /* getters */
  Authentication get authentication => Authentication.of(this);

  UserAuthentication get userAuthentication =>
      authentication.state.userAuthentication;

  bool get authenticated => authentication.state.authenticated;

  /* actions */
  void authenticate(UserAuthentication auth) {
    authentication.state.value = auth;
  }

  void logout() {
    authentication.state.value = UserAuthentication();
  }
}
