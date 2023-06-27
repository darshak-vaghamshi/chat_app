import 'package:flutter/material.dart';
import 'package:flutter_login/login_Page.dart';
import 'package:flutter_login/widget/material_button.dart';

import 'widget/text_field_widget.dart';

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phonedController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController genderController = TextEditingController();
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
                  "Sign Up",
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
                onTap: () {}),
            const SizedBox(
              height: 10,
            ),
            TextFieldWidget(
                controller: emailController,
                labelText: "Email",
                icon: Icons.email_sharp,
                onTap: () {}),
            const SizedBox(
              height: 10,
            ),
            TextFieldWidget(
                keyboardType: TextInputType.number,
                controller: phonedController,
                labelText: "Phone Number",
                icon: Icons.phone,
                onTap: () {}),
            const SizedBox(
              height: 10,
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
              height: 10,
            ),
            TextFieldWidget(
                controller: genderController,
                labelText: "Gender",
                icon: Icons.man,
                onTap: () {}),
            const SizedBox(
              height: 20,
            ),
            MaterialButtonBar(
              labelText: "Sign Up",
              onTab: () {
                if (usernameController.text == "" ||
                    emailController.text == "" ||
                    phonedController.text == "" ||
                    passwordController.text == "" ||
                    genderController.text == "") {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Required *"),
                      backgroundColor: Colors.deepPurple,
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
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
