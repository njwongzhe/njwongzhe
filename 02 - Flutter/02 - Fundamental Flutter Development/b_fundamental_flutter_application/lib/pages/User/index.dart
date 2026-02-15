import 'package:b_fundamental_flutter_application/components/LoginField.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  LoginField loginField = LoginField();
  TextEditingController _userName = TextEditingController(); // Collect username.
  TextEditingController _password = TextEditingController(); // Collect password.

  @override
  Widget build(BuildContext context) {
    return Container(
      /* "Container" Decoration */
      width: 800,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 0.1),
        borderRadius: BorderRadius.circular(20)
      ),

      /* Login Form */
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          loginField.getInput(_userName, "Username", false),
          SizedBox(height: 10),
          loginField.getInput(_password, "Password", true),
          SizedBox(height: 10),
          loginField.getButton(_userName, _password),
          SizedBox(height: 30),
          loginField.dividerLine("OR"),
          SizedBox(height: 10),
          loginField.getGoogleLogin(),
        ]
      )
    );
  }
}