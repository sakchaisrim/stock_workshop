import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mystock_master/src/config/theme.dart' as custom_theme;
import 'package:mystock_master/src/constants/asset.dart';
import 'package:mystock_master/src/pages/home/widgets/login_form.dart';

import '../home/widgets/header.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: custom_theme.Theme.gradient,
            ),
          ),
          Column(
            children: <Widget>[
              Header(),
              LoginForm(),
              Text('forgot password'),
              Text('SSO'),
              Text('register'),
            ],
          ),
        ],
      ),
    );
  }
}
