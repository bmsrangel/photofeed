import 'package:firebase_auth/firebase_auth.dart';
import 'package:photofeed/app/shared/modules/user_model.dart';
import 'package:photofeed/app/shared/repositories/auth/auth_repository.dart';

class FirebaseAuthRepositoryImpl implements AuthRepository {
  FirebaseAuthRepositoryImpl(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  @override
  Future<UserModel> loginWithEmailPassword(String email, String password) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }
}
