import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

import 'widgets/custom_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photofeed'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomTextFormField(
                labelText: 'E-mail',
              ),
              const SizedBox(height: 10.0),
              CustomTextFormField(
                labelText: 'Password',
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot your password?',
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              FractionallySizedBox(
                widthFactor: .6,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Login'),
                ),
              ),
              const SizedBox(height: 20.0),
              const Text('Or'),
              const SizedBox(height: 20.0),
              SignInButton(
                Buttons.Google,
                text: 'Sign in with Google',
                shape: const StadiumBorder(),
                padding: const EdgeInsets.all(5.0),
                onPressed: () {},
              ),
              const SizedBox(height: 40.0),
              const Text('Don\'t have an account?'),
              TextButton(
                child: const Text('Create one!'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
