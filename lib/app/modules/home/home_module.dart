import 'package:flutter_modular/flutter_modular.dart';
import 'package:photofeed/app/modules/home/guards/auth_guard.dart';
import 'package:photofeed/app/modules/home/home_page.dart';
import 'package:photofeed/app/shared/services/current_user_service.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.instance(CurrentUserService),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, __) => const HomePage(title: 'Photofeed'),
      guards: [
        AuthGuard(),
      ],
    ),
  ];
}
