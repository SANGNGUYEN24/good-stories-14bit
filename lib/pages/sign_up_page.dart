import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';

import '../utils/user_login_status.dart';
import '../model/user.dart';
import '../firebases/auth.dart';
import '../firebases/database.dart';
import '../widgets//auth_widget.dart';
import 'home_page.dart';
import 'sign_in_page.dart';

// Firebase Realtime:
import 'package:firebase_core/firebase_core.dart';

class SignUp extends StatefulWidget {
  final FirebaseApp app;

  const SignUp({
    Key? key,
    required this.app,
  }) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  AuthService authService = new AuthService();
  DatabaseService databaseService = DatabaseService();
  String userName = "";
  String email = "";
  String password = "";
  String error = "";
  //bool _isLoading = false;

  FirebaseAuth _auth = FirebaseAuth.instance;

  void showSnackBarLoading() {
    final snackBar = SnackBar(
      duration: Duration(minutes: 10),
      behavior: SnackBarBehavior.fixed,
      content: Container(
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 5,
                color: Colors.blue,
                backgroundColor: Colors.white,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Loading...",
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  void showSnackBarMessage(String mess) {
    final snackBar = SnackBar(
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.fixed,
      content: Row(
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(child: Text(mess)),
        ],
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  // User object based on FirebaseUser
  FirebaseUser? _userFromFirebaseUser(User user) {
    // ignore: unnecessary_null_comparison
    return user != null ? FirebaseUser(uid: user.uid) : null;
  }

  Future signUpEmailAndPassword(String email, String password) async {
    try {
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? firebaseUser = authResult.user;

      // change value of _isLoading
      // setState(() {
      //   _isLoading = true;
      // });

      return _userFromFirebaseUser(firebaseUser!);
    } on PlatformException catch (e) {
      if (e.code == 'email-already-in-use')
        showSnackBarMessage(
            "The email address is already in use by another account");
      return null;
    }
  }

  signUp() async {
    if (_formKey.currentState!.validate()) {
      showSnackBarLoading();
      dynamic val = await signUpEmailAndPassword(email, password);
      if (val == null) {
        setState(() {
          error = "The email address is already in use by another account";
        });
        showSnackBarMessage(error);
        return val;
      }
      UserLoginStatus.saveUserLoggedInDetail(isLoggedIn: true);

      // TODO: Set User info into Realtime database:
      await databaseService.createDefaultData(userName);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home(app: widget.app),
        ),
      );
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          height: MediaQuery.of(context).size.height - 100,
          alignment: Alignment.topCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.asset(
                    'images/icon_app.png',
                    fit: BoxFit.fill,
                  ),
                  Text(
                    'Good stories',
                    style: TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 24,
                    ),
                  ),
                  Spacer(flex: 2),
                  TextFormField(
                    validator: (val) {
                      return val!.isEmpty ? "Enter name!" : null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(Icons.person),
                      hintText: "Name",
                    ),
                    onChanged: (val) {
                      userName = val;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(Icons.mail),
                      hintText: "Email",
                    ),
                    validator: (email) {
                      return !EmailValidator.validate(email!)
                          ? "Enter a valid email!"
                          : null;
                    },
                    onChanged: (val) {
                      email = val;
                    },
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: [AutofillHints.email],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    validator: (val) {
                      return val!.length < 6
                          ? "Password at least 6 characters"
                          : null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(Icons.vpn_key),
                      hintText: "Password",
                    ),
                    onChanged: (val) {
                      password = val;
                    },
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  GestureDetector(
                    onTap: () {
                      signUp();
                    },
                    child: authButton(
                        context: context, label: "Sign up with your email"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(fontSize: 15),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignIn(app: widget.app),
                            ),
                          );
                        },
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            fontSize: 15,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}