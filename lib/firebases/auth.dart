import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final googleSignIn = GoogleSignIn();
  FirebaseAuth _auth = FirebaseAuth.instance;

  String getUserID() {
    final User? user = _auth.currentUser;
    String uid = user!.uid;
    return uid;
  }

  String? getUserEmail() {
    final User? user = _auth.currentUser;
    String? email = user!.email;
    return email;
  }

  // TODO consider where this function is used
  Future signOut() async {
    try {
      googleSignIn.disconnect();
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
