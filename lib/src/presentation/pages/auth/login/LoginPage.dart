import 'package:flutter/material.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/auth/login/LoginContent.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: LoginContent(),
    ));
  }
}
