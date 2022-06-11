import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:photofeed/app/shared/dtos/sign_up_dto.dart';
import 'package:photofeed/app/shared/exceptions/auth_exception.dart';
import 'package:photofeed/app/shared/repositories/auth/auth_repository.dart';

import '../../models/user_model.dart';

class FirebaseAuthRepositoryImpl implements AuthRepository {
  FirebaseAuthRepositoryImpl(
    this._firebaseAuth,
    this._googleSignIn,
  );

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  @override
  Future<UserModel> loginWithEmailPassword(
    String email,
    String password,
  ) async {
    try {
      final credentials = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = credentials.user;
      final userModel = UserModel(
        id: user!.uid,
        displayName: user.displayName!,
        email: user.email!,
        profileUrl: user.photoURL,
      );
      return userModel;
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.code);
    }
  }

  @override
  Future<UserModel> loginWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      final user = userCredential.user;
      final userModel = UserModel(
        id: user!.uid,
        displayName: user.displayName!,
        email: user.email!,
        profileUrl: user.photoURL,
      );
      return userModel;
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.code);
    }
  }

  @override
  Future<UserModel> signUpWithEmailPassword(SignUpDTO userData) async {
    try {
      final credentials = await _firebaseAuth.createUserWithEmailAndPassword(
        email: userData.email,
        password: userData.password,
      );
      final user = credentials.user;
      await user!.updateDisplayName(userData.displayName);
      final userModel = UserModel(
        id: user.uid,
        displayName: user.displayName!,
        email: user.email!,
        profileUrl: user.photoURL,
      );
      return userModel;
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.code);
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.code);
    }
  }
}
