import 'package:flutter/material.dart';
import 'package:smtest/LoginPage.dart';
import 'package:smtest/Register_Page.dart';

class LoginOrRegister extends StatelessWidget {
  final bool showLoginPage;
  final VoidCallback onToggle;

  LoginOrRegister({required this.showLoginPage, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return showLoginPage
        ? LoginPage(onToggle: onToggle)
        : RegisterPage(onToggle: onToggle);
  }
}
