import 'package:flutter_lab/error_handling_homework/data/repository/entity/user_entity.dart';

class CustomServerError implements Exception {
  CustomServerError(this.message);

  final String message;
}

class FakeUserRepository {
  Future<UserEntity> getUserProfile(bool shouldFail) async {
    await Future<void>.delayed(const Duration(seconds: 1));

    try {
      if (shouldFail) {
        throw Exception('Server is temporarily unavailable');
      }

      return UserEntity(id: '1', name: 'Test User');
    } catch (_) {
      throw CustomServerError('Server is temporarily unavailable');
    }
  }
}
