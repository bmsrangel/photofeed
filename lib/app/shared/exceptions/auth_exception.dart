class AuthException implements Exception {
  AuthException(this.errorCode);

  final String errorCode;

  String get message {
    if (errorCode == 'wrong-password') {
      return 'A senha é inválida ou o usuário não possui uma senha.';
    } else if (errorCode == 'user-not-found') {
      return 'Não há registro de usuário correspondente à este identificador. O usuário pode ter sido excluído.';
    } else {
      return '';
    }
  }
}
