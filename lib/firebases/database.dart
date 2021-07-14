import 'auth.dart';

// Firebase Realtime:
import 'package:firebase_database/firebase_database.dart';

class DatabaseService {
  final databaseRef = FirebaseDatabase.instance.reference();

  Future<void> createDefaultData(userName) async {
    String userID = AuthService().getUserID();
    String? userEmail = AuthService().getUserEmail();
    await databaseRef.child("users").child(userID).set({
      "avatar":
          "https://fragstrat.com/wp-content/uploads/2021/05/Yoimiya-temp.png",
      "name": userName,
      "email": userEmail,
      "password": "",
      "about":
          "Fireworks are the highlight of the festival, and Yoimiya is Inazuma's best pyrotechnician. Every display she planned turns out fabulously.",
    });
  }
}
