import 'package:photofeed/app/shared/models/user_model.dart';

abstract class CurrentUserService {
  Future<UserModel?> getCurrentUser();
}
