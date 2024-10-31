import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smtest/LoginPage.dart';

class HomeScreenPage extends StatelessWidget {
  HomeScreenPage({super.key});

  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( centerTitle: true,
        title: Text("Home:  "+user.email!),
        actions: [IconButton(onPressed: FirebaseAuth.instance.signOut, icon: Icon(Icons.login_rounded))], backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center Column vertically
          crossAxisAlignment: CrossAxisAlignment.center, // Center Column horizontally
          children: <Widget>[
            Text("logged in"),
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}
