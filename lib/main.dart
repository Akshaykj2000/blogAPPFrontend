import 'package:blog_app_front_end/pages/signinPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(mainPage());
}
class mainPage extends StatelessWidget {
  const mainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: signinPage(),
    );
  }
}
