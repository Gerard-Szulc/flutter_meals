import 'package:flutter/material.dart';
import 'package:flutter_meals/auth/auth.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountEmail: Text('email'),
              accountName: Text('name'),
              // currentAccountPicture: Image.network(
              //   'exampleimage',
              // ),
            ),
            ListTile(
              title: Text('hello'),
              enabled: true,
            ),
            ListTile(
              title: Text('Sign Out'),
              onTap: () {
                var result = _authService.signOut();
                if (result) {
                  print('success sing out');
                } else {
                  print('error sign out');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
