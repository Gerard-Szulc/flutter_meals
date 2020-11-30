import 'package:flutter/material.dart';
import 'package:flutter_meals/auth/auth.dart';

class SignGoogleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _signInButton();
  }
}

Widget _signInButton() {
  final AuthService _authService = AuthService();

  return OutlineButton(
    splashColor: Colors.grey,
    onPressed: () async {
      await _authService.signInWithGoogle();
    },
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
    highlightElevation: 0,
    borderSide: BorderSide(color: Colors.grey),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Sign in with Google',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
