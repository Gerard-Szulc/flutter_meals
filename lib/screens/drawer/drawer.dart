import 'package:flutter/material.dart';
import 'package:flutter_meals/auth/auth.dart';
import 'package:flutter_meals/models/userModel.dart';
import 'package:provider/provider.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    // String displayName = 'name';
    // String userEmail = 'email';
    // String photoUrl = 'asdas';

    final user = Provider.of<AppUser>(context);

    return Drawer(
      child: Center(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountEmail: Text(user.email),
                accountName: Text(user.displayName),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(user.photoURL),
                )),
            ListTile(
              title: Text('hello'),
              enabled: true,
            ),
            ListTile(
              title: Text('Sign Out'),
              onTap: () {
                var result = _authService.signOut();
                _authService.signOutGoogle();

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
