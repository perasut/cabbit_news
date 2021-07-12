import 'package:flutter/material.dart';
import 'package:smart_news/Themes/colors.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Login', style: TextStyle(color: textColorSecondary),),
      ),
      body: Center(
        child: Text('Login content'),
      ),
    );
  }
}
