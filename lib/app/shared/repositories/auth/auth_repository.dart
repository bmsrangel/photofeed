import 'package:photofeed/app/shared/modules/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> loginWithEmailPassword(String email, String password);
}
