import 'package:flutter/material.dart';
import 'package:photofeed/app/modules/auth/pages/widgets/custom_text_form_field.dart';
import 'package:validatorless/validatorless.dart';

import '../validators/custom_validators.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Conta'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextFormField(
              labelText: 'Nome',
            ),
            const SizedBox(height: 10.0),
            CustomTextFormField(
              labelText: 'E-mail',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10.0),
            CustomTextFormField(
              labelText: 'Senha',
              obscureText: true,
              validator: Validatorless.multiple([
                Validatorless.required('Campo obrigatório'),
                Validatorless.min(
                  6,
                  'A senha precisa ter no mínimo 6 caracteres',
                ),
                CustomValidators.containsNumberValidator(
                  'A senha precisa ter pelo menos um número',
                ),
                CustomValidators.upperCaseCharacteresValidator(
                  'A senha precisa ter pelo menos uma letra maiúscula',
                ),
                CustomValidators.lowerCaseCharacteresValidator(
                  'A senha precisa ter pelo menos uma letra minúscula',
                ),
                CustomValidators.specialCharacteresValidator(
                  'A senha não possui caracteres especiais',
                ),
              ]),
            ),
            const SizedBox(height: 10.0),
            CustomTextFormField(
              labelText: 'Confirmar Senha',
              obscureText: true,
            ),
            const SizedBox(height: 30.0),
            FractionallySizedBox(
              widthFactor: .6,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Criar conta'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
