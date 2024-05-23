import 'dart:io';

import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  // Attribute
  // (keine)

  // Konstruktor
  const FormScreen({super.key});

  // Methoden
  @override
  Widget build(BuildContext context) {
    var textFormField = TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        label: Text("Email"),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validateEmail,
    );
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          child: Column(children: [
            textFormField,
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Passwort"),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validatePw,
            ),
            const SizedBox(height: 32),
            FilledButton(
              onPressed: () {},
              child: const Text("Login"),
            ),
          ]),
        ),
      ),
    );
  }

  bool validateEmail(String? input) {
    //bool validateEmail(String email) {
    final RegExp emailRegex =
        RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    final bool isValidEmail = emailRegex.hasMatch(email);

    if (!isValidEmail) {
      return false;
    }

    var email;
    final List<String> emailParts = email.split('@');
    final String domain = emailParts[1];

    if (domain.endsWith('.com') || domain.endsWith('.de')) {
      return true;
    }

    return false;
  }

  String? validatePw(String? input) {
    bool isValidPassword(String password) {
      if (password.length < 6 || password.length > 22) {
        return false;
      }
      return true;
    }

    print("Please enter a password to check its validity:");
    var inputPassword = stdin.readLineSync();
    if (isValidPassword(inputPassword!)) {
      print("The password is valid.");
    } else {
      print(
          "The password is not valid. It must be between 6 and 22 characters long.");
    }
    return null;
  }
}
