import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smtest/Home_Page.dart';
import 'package:smtest/login-or-register.dart';  // Import the updated toggle page
import 'firebase_options.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void togglePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreenPage(); // Navigate to the home page if the user is logged in
          } else {
            // Return LoginOrRegister with a toggle callback
            return LoginOrRegister(
              showLoginPage: showLoginPage,
              onToggle: togglePage,
            );
          }
        },
      ),
    );
  }
}
