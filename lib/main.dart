import 'package:flutter/material.dart';

void main() {
  runApp(mainPage());
}
class mainPage extends StatelessWidget {
  const mainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: signinpage(),
    );
  }
}
