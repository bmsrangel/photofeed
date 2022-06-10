import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:photofeed/app/modules/home/home_module.dart';
import 'package:photofeed/app/modules/splash/splash_module.dart';
import 'package:photofeed/app/shared/repositories/auth/auth_repository.dart';
import 'package:photofeed/app/shared/repositories/auth/firebase_auth_repository_impl.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<AuthRepository>(
      (i) => FirebaseAuthRepositoryImpl(
        FirebaseAuth.instance,
        GoogleSignIn(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute('/splash', module: SplashModule()),
  ];
}
