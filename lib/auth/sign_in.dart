import 'package:flutter/material.dart';
import 'package:flutter_meals/auth/auth.dart';
import 'package:flutter_meals/screens/authenticate/sign_in_google_button.dart';
import 'package:flutter_meals/screens/drawer/drawer.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  dynamic email = '';
  dynamic password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        backgroundColor: Colors.orange[500],
        elevation: 0.0,
        title: Text('Sign In'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: ListView(
            children: [
              TextField(
                onChanged: (event) {
                  email = event;
                },
              ),
              TextField(
                onChanged: (event) {
                  password = event;
                },
              ),
              RaisedButton(
                onPressed: () async {
                  print(email);
                  print(password);
                  dynamic result = await _authService
                      .signInWithEmailAndPassword(email, password);
                  if (result == null) {
                    print('error signing');
                  } else {
                    print(result);
                  }
                },
                child: Text('Sign in with email and password'),
              ),
              RaisedButton(
                onPressed: () async {
                  dynamic result = await _authService.signInAnon();
                  if (result == null) {
                    print('error signing');
                  } else {
                    print(result);
                  }
                },
                child: Text('Sign in anon'),
              ),
              SignGoogleButton()
            ],
          ),
        ),
      ),
    );
  }
}
