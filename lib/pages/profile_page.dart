import 'package:flutter/material.dart';
import '../model/user_profile.dart';
import '../widgets/appbar_widget.dart';
import "../widgets/profile_widget.dart";
import "../widgets/button_widget.dart";
import "../widgets/numbers_widget.dart";
import "edit_profile_page.dart";
import "../firebases/auth.dart";

// Firebase Realtime:
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class ProfilePage extends StatefulWidget {
  final FirebaseApp app;

  const ProfilePage({
    Key? key,
    required this.app,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final databaseRef = FirebaseDatabase.instance.reference();

  UserProfile user = new UserProfile(
    avatar:
        'https://www.pockettactics.com/wp-content/uploads/2021/05/genshin-impact-yoimiya-1-1200x675.jpg',
    name: 'name',
    email: 'email',
    password: 'password',
    about: 'about',
  );

  void setUserData(value) {
    user = new UserProfile(
      avatar: value['avatar'],
      name: value['name'],
      email: value['email'],
      password: value['password'],
      about: value['about'],
    );
  }

  Future<void> getUserData() async {
    String uid = AuthService().getUserID();
    await databaseRef.child("users").child(uid).once().then(
      (DataSnapshot snapshot) {
        final value = snapshot.value;
        setUserData(value);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getUserData().whenComplete(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          // TODO: Add User's avatar
          ProfileWidget(
            avatar: user.avatar,
            onClicked: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) =>
                        EditProfilePage(app: widget.app, user: user)),
              );
              getUserData().whenComplete(() => setState(() {}));
            },
          ),

          // TODO: Add User's name and email
          const SizedBox(height: 24),
          buildName(user),

          // TODO: Add Button Upgrade Pro
          const SizedBox(height: 24),
          Center(child: buildUpgradeButton()),

          // TODO: Add Goals of User
          const SizedBox(height: 24),
          NumbersWidget(),

          // TODO: Add User's about
          const SizedBox(height: 48),
          buildAbout(user),
        ],
      ),
    );
  }

  // TODO: Create Text for user's about:
  Widget buildAbout(UserProfile user) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            user.about,
            style: TextStyle(fontSize: 16, height: 1.4),
          )
        ],
      ),
    );
  }

  //TODO: Create Text for user's name and email
  Widget buildName(UserProfile user) {
    return Column(
      children: [
        Text(
          user.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 4),
        Text(
          user.email,
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }

  // TODO: Create UpgradeButton
  Widget buildUpgradeButton() {
    return ButtonWidget(
      text: "Upgrade To PRO",
      onClicked: () {},
    );
  }
}
