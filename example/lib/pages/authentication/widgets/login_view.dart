import 'package:example/models/user_authentication.dart';
import 'package:flutter/material.dart';
import 'package:example/watchers/authentication.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool consent = false;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .5,
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your name',
                ),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            ElevatedButton(
              onPressed: () => _authenticate(context, controller.text),
              child: const Text('Login'),
            ),
            const SizedBox(
              height: 48.0,
            ),
            Checkbox(
                value: consent,
                onChanged: (value) {
                  setState(() {
                    consent = value!;
                  });
                }),
          ],
        ),
      ),
    );
  }

  void _authenticate(BuildContext context, String userName) {
    context.authenticate(
      UserAuthentication(
        name: userName,
        consent: consent,
      ),
    );
  }
}
