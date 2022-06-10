import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:photofeed/app/shared/services/current_user_service.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/auth/');

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {
    var currentUserService = Modular.get<CurrentUserService>();
    final currentUser = await currentUserService.getCurrentUser();
    if (currentUser != null) {
      return true;
    } else {
      return false;
    }
  }
}
