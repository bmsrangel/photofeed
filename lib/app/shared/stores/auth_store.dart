import 'package:flutter/material.dart';
import 'package:photofeed/app/shared/dtos/sign_up_dto.dart';
import 'package:photofeed/app/shared/exceptions/auth_exception.dart';
import 'package:photofeed/app/shared/models/user_model.dart';
import 'package:photofeed/app/shared/repositories/auth/auth_repository.dart';
import 'package:photofeed/app/shared/services/current_user_service.dart';

class AuthStore extends ChangeNotifier {
  AuthStore(this._authRepository, this._userService);

  final AuthRepository _authRepository;
  final CurrentUserService _userService;

  bool isLoading = false;
  UserModel? user;
  String? error;

  Future<void> getCurrentUser() async {
    user = await _userService.getCurrentUser();
  }

  Future<void> loginWithEmailPassword(String email, String password) async {
    try {
      error = null;
      isLoading = true;
      notifyListeners();
      user = await _authRepository.loginWithEmailPassword(email, password);
    } on AuthException catch (e) {
      error = e.message;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      error = null;
      user = await _authRepository.loginWithGoogle();
    } on AuthException catch (e) {
      error = e.message;
      notifyListeners();
    }
  }

  Future<void> signUpWithEmailPassword(SignUpDTO userData) async {
    try {
      error = null;
      isLoading = true;
      notifyListeners();
      user = await _authRepository.signUpWithEmailPassword(userData);
    } on AuthException catch (e) {
      error = e.message;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _authRepository.logout().then((_) {
      user = null;
      error = null;
    });
  }
}
