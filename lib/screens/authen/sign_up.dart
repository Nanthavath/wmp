import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wmp/generated/l10n.dart';
import 'package:wmp/screens/home/main_screen.dart';
import 'package:wmp/utils/constants.dart';

import 'components/text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool secure = true;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                image: AssetImage('assets/images/logo.png'),
                width: 200,
              ),
              Text(
                "Welcome to",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Where is my Pharma",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              TextFields(
                controller: nameController,
                secure: false,
                prefixIcon: Icons.account_circle,
                hint: "${S.of(context).name}",
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
                controller: emailController,
                secure: false,
                prefixIcon: Icons.email,
                hint: "${S.of(context).email}",
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
                secure: secure,
                prefixIcon: Icons.lock,
                hint: "${S.of(context).password}",
                onChanged: (value) {
                  setState(() {});
                },
                onTap: () {
                  setState(() {
                    passwordController.text = '';
                  });
                },
              ),
              _showPassword(),
              _signUpButton(),
            ],
          ),
        ),
      ),
    );
  }

  _showPassword() {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: ListTile(
        leading: Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
              if (secure) {
                secure = false;
              } else {
                secure = true;
              }
            });
          },
        ),
        title: Text('${S.of(context).show}'),
      ),
    );
  }

  _signUpButton() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => MainScreen(),
                    ),
                    (route) => false);
              },
              child: Text("${S.of(context).SignUp}"),
            ),
          ),
        ],
      ),
    );
  }
}
