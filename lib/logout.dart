import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class LogoutScreen extends StatelessWidget {
  final VoidCallback onConfirm;

  LogoutScreen({required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logout'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: onConfirm,
          child: Text('Logout'),
        ),
      ),
    );
  }
}

void _logout(BuildContext context) async {
  SharedPreferences logindata = await SharedPreferences.getInstance();
  logindata.setBool("login", false); // Anda ingin mengeset "login" menjadi false, bukan true
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
    return LoginPage();
  }));
}

