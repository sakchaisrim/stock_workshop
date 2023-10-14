import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mystock_master/src/config/theme.dart' as custom_theme;
import 'package:mystock_master/src/constants/asset.dart';
import 'package:mystock_master/src/pages/home/widgets/login_form.dart';
import 'package:mystock_master/src/pages/login/widgets/single_sign_on.dart';

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
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Header(),
                LoginForm(),
                SizedBox(height: 30,),
                _buildTextButton(
                  'forgot password',
                  onPressed: () {
                    //todo
                  },
                ),
                SingleSignOn(),
                SizedBox(height: 28,),
                _buildTextButton(
                  'register',
                  onPressed: () {
                    //todo
                  },
                ),
                SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextButton _buildTextButton(
    String text, {
    required VoidCallback? onPressed,
    double fontSize = 16,
  }) =>
      TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.normal,
          ),
        ),
      );
}
