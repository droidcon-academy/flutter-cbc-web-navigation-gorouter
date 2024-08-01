import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import 'auth_state.dart';

String loginKey = "5FD6G46SDF4GD64F1VG9SD68";

class AuthService {
  late final SharedPreferences sharedPreferences;
  final AuthState authState;

  AuthService({required this.sharedPreferences, required this.authState});

  Future<void> bootCheck() async {
    final authKey = sharedPreferences.getString('authKey');

    await Future.delayed(const Duration(seconds: 2));

    if (authKey != null && authKey == loginKey) {
      authState.updateLoginState(true, notify: false);
    } else {
      authState.updateLoginState(false, notify: false);
    }
    authState.updateInitialized(true);
  }

  Future<bool> login() async {
    sharedPreferences.setString('authKey', loginKey);
    authState.updateLoginState(true);
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  Future<void> logOut() async {
    await sharedPreferences.remove('authKey');
    authState.updateLoginState(false);
  }
}
