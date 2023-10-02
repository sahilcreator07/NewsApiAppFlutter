import 'package:flutter/material.dart';
import 'package:newsapi_app/componends/AuthPage/register_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterAuth(),
    );
  }
}

