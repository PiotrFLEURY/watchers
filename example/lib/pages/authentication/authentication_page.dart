import 'package:example/pages/authentication/widgets/login_view.dart';
import 'package:example/pages/authentication/widgets/user_view.dart';
import 'package:example/watchers/authentication.dart';
import 'package:flutter/material.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Authentication(
      state: AuthenticationState(),
      builder: (context) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          transitionBuilder: (child, animation) => FadeTransition(
            opacity: animation,
            child: child,
          ),
          child: _content(context),
        );
      },
    );
  }

  Widget _content(BuildContext context) {
    if (context.authenticated) {
      return const UserView(key: ValueKey<String>('userView'));
    } else {
      return const LoginView(
        key: ValueKey<String>('loginView'),
      );
    }
  }
}
