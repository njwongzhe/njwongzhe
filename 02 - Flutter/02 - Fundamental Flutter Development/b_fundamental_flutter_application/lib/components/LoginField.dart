import 'package:flutter/material.dart';

class LoginField {
  TextField getInput(TextEditingController username, String hint, bool obscureText) {
    return TextField(
      controller: username,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        fillColor: Colors.amber[50],
        filled: true, 
        border: OutlineInputBorder(  
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20),
        )
      )
    );
  }

  Container getButton(TextEditingController userName, TextEditingController password) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20)
      ),
      child: TextButton(
        onPressed: () => print("Login Success - Username: ${userName.text} - Password: ${password.text}"), 
        child: Text("Login", style: TextStyle(color: Colors.white))
      )
    );
  }

  Container dividerLine(String text) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Divider(color: Colors.grey, thickness: 1)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(text, style: TextStyle(color: Colors.grey)),
          ),
          Expanded(child: Divider(color: Colors.grey, thickness: 1)),
        ],
      )
    );
  }

  Container getGoogleLogin() {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey)
      ),
      child: TextButton(
        onPressed: () => print("Google Login"), 
        child: Text("Login with Google", style: TextStyle(color: Colors.black))
      )
    );
  }
}