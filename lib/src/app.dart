import 'package:flutter/material.dart';
import 'package:mystock_master/src/pages/home/home_page.dart';
import 'package:mystock_master/src/pages/login/login_page.dart';

class App extends StatelessWidget {
  const App({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyStock',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}