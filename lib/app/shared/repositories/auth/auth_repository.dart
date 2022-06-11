import 'package:photofeed/app/shared/dtos/sign_up_dto.dart';

import '../../models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> loginWithEmailPassword(String email, String password);
  Future<UserModel> loginWithGoogle();
  Future<UserModel> signUpWithEmailPassword(SignUpDTO userData);
  Future<void> resetPassword(String email);
  Future<void> logout();
}
