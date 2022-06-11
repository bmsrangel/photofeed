import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
        title: const Text('PhotoFeed'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextFormField(
              labelText: 'E-mail',
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 10.0),
            CustomTextFormField(
              labelText: 'Senha',
              obscureText: true,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Modular.to.pushNamed('./reset');
                },
                child: const Text(
                  'Esqueceu sua senha?',
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            FractionallySizedBox(
              widthFactor: .7,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Entrar'),
              ),
            ),
            const SizedBox(height: 20.0),
            const Text('ou'),
            const SizedBox(height: 20.0),
            FractionallySizedBox(
              widthFactor: .7,
              child: SignInButton(
                Buttons.Google,
                text: 'Entrar com conta Google',
                shape: const StadiumBorder(),
                padding: const EdgeInsets.all(3.0),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 40.0),
            const Text('Não possui conta?'),
            TextButton(
              child: const Text('Crie a sua!'),
              onPressed: () {
                Modular.to.pushNamed('./signup');
              },
            ),
          ],
        ),
      ),
    );
  }
}
