
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smtest/database_services.dart';
import 'database_services.dart';
class RegisterPage extends StatefulWidget {
  final VoidCallback onToggle;


  RegisterPage({required this.onToggle});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmcontroller = TextEditingController();
  final _db = DatabaseService();
  @override
  void dispose() {
    namecontroller.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    confirmcontroller.dispose();
    super.dispose();
  }

  void signUserUp() async {
    if (passwordcontroller.text != confirmcontroller.text) {
      // Display an error if passwords don't match
      print('Passwords do not match');
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text,
        password: passwordcontroller.text,
      );
      await _db.saveUserInfoInFirebase(name: namecontroller.text, email: emailcontroller.text);
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
        title: Text('Register'),
        backgroundColor: Colors.blue,
        centerTitle: true,
        shadowColor: Colors.black87,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.password, size: 100, color: Colors.grey),
              SizedBox(height: 20),
              Text("Let's create an account"),
              SizedBox(height: 20),
              TextField(
                controller: namecontroller,
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
                controller: emailcontroller,
                cursorColor: Colors.blueGrey,
                decoration: InputDecoration(
                  labelText: 'e-mail',
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
              SizedBox(height: 20),
              TextField(
                controller: confirmcontroller,
                cursorColor: Colors.blueGrey,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
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
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: signUserUp,
                child: Text('Register!'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  onPrimary: Colors.white60,
                  padding: EdgeInsets.symmetric(horizontal: 150, vertical: 30),
                ),
              ),
              SizedBox(height: 20),
              Divider(
                color: Colors.grey,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              SizedBox(height: 20),
              Text(
                "or",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: widget.onToggle,
                child: Text('Back to Login'),
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
