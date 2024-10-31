import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smtest/Register_Page.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onToggle;

  LoginPage({required this.onToggle});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  void signUserIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text,
        password: passwordcontroller.text,
      );
      // Optionally, navigate to another screen upon successful login
    } catch (e) {
      print('Error: $e');
      // Handle errors (e.g., display a message to the user)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.blue,
        centerTitle: true,
        shadowColor: Colors.black87,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.lock, size: 100, color: Colors.grey),
              SizedBox(height: 50),
              TextField(
                controller: emailcontroller,
                cursorColor: Colors.blueGrey,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(color: Colors.black26),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 20),
              TextField(
                controller: passwordcontroller,
                cursorColor: Colors.blueGrey,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.black26),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 5),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  signUserIn();
                },
                child: Text('Log-in!'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  onPrimary: Colors.white60,
                  padding: EdgeInsets.symmetric(horizontal: 150, vertical: 30),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 5),
              Divider(
                color: Colors.grey,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              Text(
                "or",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: widget.onToggle,
                child: Text('Sign-Up!'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  onPrimary: Colors.white60,
                  padding: EdgeInsets.symmetric(horizontal: 150, vertical: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
