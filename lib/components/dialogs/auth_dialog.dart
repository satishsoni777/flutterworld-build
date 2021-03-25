import 'package:flutter/material.dart';

class AppDialogs {
  BuildContext _context;
  AppDialogs._(this._context);
  static AppDialogs _instalce;
  static AppDialogs of(BuildContext context) {
    _instalce = AppDialogs._(context);
    return _instalce;
  }

// Log in dialog
  Future<void> logInDialog() async {
    await showDialog(
        context: AppDialogs._instalce._context,
        builder: (context) {
          return LoginDialog();
        });
  }
}

class LoginDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(child: AspectRatio(aspectRatio: 1, child: Card()));
  }
}
