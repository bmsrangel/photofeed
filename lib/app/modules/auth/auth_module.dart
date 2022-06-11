import 'package:flutter_modular/flutter_modular.dart';
import 'package:photofeed/app/modules/auth/pages/login_page.dart';
import 'package:photofeed/app/modules/auth/pages/reset_password_page.dart';
import 'package:photofeed/app/modules/auth/pages/sign_up_page.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => const LoginPage()),
    ChildRoute('/signup', child: (_, __) => const SignUpPage()),
    ChildRoute('/reset', child: (_, __) => const ResetPasswordPage()),
  ];
}
