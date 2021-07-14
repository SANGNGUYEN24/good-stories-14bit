import 'dart:convert';

import "package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';
import '../model/user_profile.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/profile_widget.dart';
import '../widgets/textfield_widget.dart';
import "../firebases/auth.dart";

// Firebase Realtime:
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class EditProfilePage extends StatefulWidget {
  final FirebaseApp app;
  UserProfile user;

  EditProfilePage({
    Key? key,
    required this.user,
    required this.app,
  }) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final databaseRef = FirebaseDatabase.instance.reference();

  void createData(var json) {
    String uid = AuthService().getUserID();
    databaseRef.child("users").child(uid).set(json).asStream();
  }

  Future<void> updateUserData() async {
    String uid = AuthService().getUserID();
    await databaseRef.child("users").child(uid).update({
      "avatar": widget.user.avatar,
      "name": widget.user.name,
      "email": widget.user.email,
      "password": widget.user.password,
      "about": widget.user.about,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        physics: BouncingScrollPhysics(),
        children: [
          // TODO: Add User's avatar
          ProfileWidget(
            avatar: widget.user.avatar,
            isEdit: true,
            // TODO: Pick Image from Gallery
            onClicked: () async {
              final pickedFile =
                  await ImagePicker().getImage(source: ImageSource.gallery);
              if (pickedFile == null) return;
              final bytes = await pickedFile.readAsBytes();
              final base64Image = base64Encode(bytes);
              setState(() {
                widget.user = widget.user.copy(avatar: base64Image);
              });
            },
          ),

          // TODO: Add User's name
          const SizedBox(height: 24),
          TextFieldWidget(
            label: "Full Name",
            text: widget.user.name,
            onChanged: (name) => widget.user = widget.user.copy(name: name),
          ),

          // TODO: Add User's email
          const SizedBox(height: 24),
          TextFieldWidget(
            label: "Email",
            text: widget.user.email,
            onChanged: (email) => widget.user = widget.user.copy(email: email),
          ),
          // TODO: Add User's password
          const SizedBox(height: 24),
          TextFieldWidget(
            label: "Password",
            text: widget.user.password,
            onChanged: (password) =>
                widget.user = widget.user.copy(password: password),
          ),
          // TODO: Add User's about
          const SizedBox(height: 24),
          TextFieldWidget(
            label: "About",
            text: widget.user.about,
            maxLines: 10,
            onChanged: (about) => widget.user = widget.user.copy(about: about),
          ),
          // TODO: Add Button Save:
          const SizedBox(height: 24),
          ButtonWidget(
            text: 'Save',
            onClicked: () async {
              await updateUserData();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
