import 'package:flutter/material.dart';
import 'package:flutter_login/chat.dart';
import 'package:flutter_login/login_page.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Demo',
      // theme: ThemeData(
      // primarySwatch: Colors.blue,
      // ),
      // routes: {
      // "/": ((context) => ChatPage()),
      // "/chat": ((context) => Chat()),
      // },
      home: const LoginPage(),
    );
  }
}
