import 'package:flutter/material.dart';
import 'package:wmp/utils/constants.dart';

import 'components/text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            TextFields(
              controller: nameController,
              secure: false,
              prefixIcon: Icons.account_circle,
              hint: "Name",
              onChanged: (value) {
                setState(() {});
              },
              onTap: () {
                setState(() {
                  nameController.text = '';
                });
              },
            ),
            TextFields(
              controller: surnameController,
              secure: false,
              prefixIcon: Icons.people,
              hint: "Surname",
              onChanged: (value) {
                setState(() {});
              },
              onTap: () {
                setState(() {
                  surnameController.text = '';
                });
              },
            ),
            TextFields(
              controller: emailController,
              secure: false,
              prefixIcon: Icons.email,
              hint: "Email",
              onChanged: (value) {
                setState(() {});
              },
              onTap: () {
                setState(() {
                  emailController.text = '';
                });
              },
            ),
            TextFields(
              controller: passwordController,
              secure: true,
              prefixIcon: Icons.lock,
              hint: "Password",
              onChanged: (value) {
                setState(() {});
              },
              onTap: () {
                setState(() {
                  passwordController.text = '';
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
