import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/user_login_status.dart';
import '../firebases/database.dart';
import 'sign_in_page.dart';
import 'profile_page.dart';
import '../widgets/auth_widget.dart';

// Firebase Realtime:
import 'package:firebase_core/firebase_core.dart';

class Home extends StatefulWidget {
  final FirebaseApp app;

  const Home({
    Key? key,
    required this.app,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DatabaseService databaseService = new DatabaseService();
  FirebaseAuth _user = FirebaseAuth.instance;

  confirmSignOut() {
    final snackBar = SnackBar(
      elevation: 2.0,
      behavior: SnackBarBehavior.fixed,
      content: Text("Do you want to sign out?"),
      action: SnackBarAction(
        label: "SIGN OUT",
        onPressed: () {
          _user.signOut();
          UserLoginStatus.saveUserLoggedInDetail(isLoggedIn: false);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SignIn(
                app: widget.app,
              ),
            ),
          );
        },
      ),
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              confirmSignOut();
            },
            icon: Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: MaterialButton(
            child: Text('Go to profile'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProfilePage(app: widget.app),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
