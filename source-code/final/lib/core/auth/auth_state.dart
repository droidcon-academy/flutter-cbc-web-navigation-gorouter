import 'package:flutter/widgets.dart';

class AuthState with ChangeNotifier {
  bool _loginState = false;
  bool _initialized = false;

  bool get loginState => _loginState;
  bool get initialized => _initialized;

  void updateLoginState(bool state, {bool notify = true}) {
    _loginState = state;
    if (notify) {
      notifyListeners();
    }
  }

  void updateInitialized(bool value, {bool notify = true}) {
    _initialized = value;
    if (notify) {
      notifyListeners();
    }
  }
}
