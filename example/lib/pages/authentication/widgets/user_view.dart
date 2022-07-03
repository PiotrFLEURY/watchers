import 'package:example/watchers/consent.dart';
import 'package:flutter/material.dart';
import 'package:example/watchers/authentication.dart';
import 'package:watchers/states/bool_state.dart';

class UserView extends StatelessWidget {
  const UserView({Key? key}) : super(key: key);

  void _logout(BuildContext context) {
    context.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => _logout(context),
            icon: const Icon(Icons.power_settings_new),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(Icons.person),
            Text('Hello ${context.userAuthentication.name}'),
            const Text('Do you consent ?'),
            Consent(
              state: BoolState(context.userAuthentication.consent),
              builder: (context) => Switch(
                value: context.userConsent,
                onChanged: (value) {
                  context.onUserConsentChanged(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
