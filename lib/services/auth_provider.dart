import 'package:flutter/material.dart';
import 'auth_services.dart';

class UserProvider extends InheritedWidget {
  final AuthService auth;
  UserProvider({
    Key key,
    Widget child,
    this.auth,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWiddget) {
    return true;
  }

  static UserProvider of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<UserProvider>());
}
