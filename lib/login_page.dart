import 'package:flutter/material.dart';
import 'package:flutter_login/home_page.dart';
import 'package:flutter_login/sign_Page.dart';
import 'package:flutter_login/widget/material_button.dart';
import 'package:flutter_login/widget/text_field_widget.dart';

import 'chat.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 90),
        child: Column(
          children: [
            Image.asset(
              "assets/images/login.jpg",
              height: 200,
              width: 600,
              fit: BoxFit.fill,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Login",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldWidget(
              controller: usernameController,
              labelText: "Username",
              icon: Icons.person_2_rounded,
              onTap: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldWidget(
              controller: passwordController,
              obscureText: _obscureText,
              labelText: "password",
              icon: _obscureText ? Icons.visibility_off : Icons.visibility,
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("If you don't have an Account? "),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SignPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButtonBar(
              labelText: "Login",
              onTab: () {
                if (usernameController.text == "" ||
                    passwordController.text == "") {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Required *"),
                      backgroundColor: Colors.deepPurple,
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ChatPage()),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
