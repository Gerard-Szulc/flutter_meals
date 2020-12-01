import 'package:flutter/material.dart';
import 'package:flutter_meals/models/userModel.dart';
import 'package:flutter_meals/screens/authenticate/authenticate.dart';
import 'package:flutter_meals/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context);
    if (user == null) {
      return Authenticate();
    }
    // return MyHomePage(title: 'Home page title');
    return MyHomePage(title: 'asASDSD');
  }
}
