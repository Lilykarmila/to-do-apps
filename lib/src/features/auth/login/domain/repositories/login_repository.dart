import 'dart:async';

import '../../../../../core/resources/data_state.dart';

abstract class LoginRepository {
  Future<DataState<String>> login({
    required String email,
    required String password,
  });
}
