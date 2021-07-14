import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'utils/user_login_status.dart';
import './pages/home_page.dart';
import './pages/sign_in_page.dart';

// Firebase Realtime:
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Make Firebase:
  final FirebaseApp app = await Firebase.initializeApp();
  runApp(MyApp(app: app));
}

class MyApp extends StatefulWidget {
  final FirebaseApp app;
  const MyApp({
    Key? key,
    required this.app,
  }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    checkUserLoggedInStatus();
    //TODO implement initial State
    super.initState();
  }

  checkUserLoggedInStatus() async {
    await UserLoginStatus.getUserLoggedInDetail().then((value) {
      setState(() {
        _isLoggedIn = value!;
      });
      print("------------------------$_isLoggedIn");
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: (_isLoggedIn) ? Home(app: widget.app) : SignIn(app: widget.app),
    );
  }
}
