import 'package:another_flushbar/flushbar.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mystock_master/src/config/theme.dart' as custom_theme;
import 'package:mystock_master/src/config/route.dart' as custom_route;
import 'package:mystock_master/src/constants/setting.dart';
import 'package:mystock_master/src/utils/RegexValidator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String _errorUsername = '';
  String _errorPassword = '';

  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameController?.dispose();
    passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        _buildForm(),
        _buldSubmitFormButton(),
      ],
    );
  }

  Card _buildForm() => Card(
        margin: EdgeInsets.only(bottom: 22, left: 22, right: 22),
        elevation: 2.0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 58, left: 28, right: 28),
          child: FormInput(
            usernameController: usernameController,
            passwordController: passwordController,
            errorUsername: _errorUsername,
            errorPassword: _errorPassword,
          ),
        ),
      );

  Container _buldSubmitFormButton() => Container(
        width: 220,
        height: 50,
        decoration: _BoxDecoration(),
        child: TextButton(
          onPressed: _onLogin,
          child: Text(
            'LOGIN',
            style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.w700),
          ),
        ),
      );

  BoxDecoration _BoxDecoration() {
    final gradientStart = custom_theme.Theme.gradientStart;
    final gradientEnd = custom_theme.Theme.gradientEnd;

    final boxShadowItem = (Color color) => BoxShadow(
          color: color,
          offset: Offset(1.0, 6.0),
          blurRadius: 20.0,
        );

    return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        boxShadow: [
          boxShadowItem(gradientStart),
          boxShadowItem(gradientEnd),
        ],
        gradient: LinearGradient(
          colors: [
            gradientEnd,
            gradientStart,
          ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 1.0),
        ));
  }

  void showAlertBar() {
    Flushbar(
      title: 'Username or Password is incorrect',
      message: 'Please try again',
      icon: Icon(
        Icons.error,
        size: 28.0,
        color: Colors.red,
      ),
      duration: Duration(seconds: 3),
      margin: EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
    )..show(context);
  }

  void showLoading() {
    Flushbar(
      message: 'Loading...',
      showProgressIndicator: true,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
    )..show(context);
  }

  void _onLogin() {
    String username = usernameController.text;
    String password = passwordController.text;

    _errorUsername = '';
    _errorPassword = '';

    if (!EmailSubmitRegexValidator().isValid(username)) {
      _errorUsername = 'The Email mute be a valid email.';
    }

    if (password.length < 8) {
      _errorPassword = 'Mute be at least 8 characters.';
    }
    if (_errorUsername == '' && _errorPassword == '') {
      showLoading();
      Future.delayed(Duration(seconds: 2)).then((value) async{
        Navigator.pop(context);
        if (username == 'sakchai@gmail.com' && password == '12345678') {
          // print('Success');
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => HomePage(name: 'aaa', age: 25,),
          //   ),
          // );
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(Setting.TOKEN_PREF, 'asdfghjkl');
          prefs.setString(Setting.USERNAME_PREF, username);

          Navigator.pushReplacementNamed(context, custom_route.Route.home,
          );
        } else {
          showAlertBar();
          setState(() {});
        }
      });
    } else {
      setState(() {});
    }
    // print(usernameController.text);
    // print(passwordController.text);
  }
}

class FormInput extends StatefulWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final String errorUsername;
  final String errorPassword;

  const FormInput({
    key,
    required this.usernameController,
    required this.passwordController,
    required this.errorUsername,
    required this.errorPassword,
  }) : super(key: key);

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  final _color = Colors.black54;

  late bool _obscureTextPassword;
  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    _obscureTextPassword = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildUserName(),
        Divider(
          height: 22,
          thickness: 1,
          indent: 13,
          endIndent: 13,
        ),
        _buildPassword(),
      ],
    );
  }

  TextStyle _textStyle() => TextStyle(
        fontWeight: FontWeight.w500,
        color: _color,
      );

  TextField _buildPassword() => TextField(
        focusNode: _passwordFocusNode,
        controller: widget.passwordController,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: 'Password',
          labelStyle: _textStyle(),
          icon: FaIcon(
            FontAwesomeIcons.lock,
            size: 22.0,
            color: _color,
          ),
          errorText: widget.errorPassword,
          suffixIcon: IconButton(
            icon: FaIcon(
              _obscureTextPassword
                  ? FontAwesomeIcons.eye
                  : FontAwesomeIcons.eyeSlash,
              color: _color,
              size: 15.0,
            ),
            onPressed: () {
              setState(() {
                _obscureTextPassword = !_obscureTextPassword;
              });
            },
          ),
        ),
        obscureText: _obscureTextPassword,
      );

  TextField _buildUserName() => TextField(
        controller: widget.usernameController,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: 'Email Address',
          labelStyle: _textStyle(),
          hintText: 'sakchai@dev.com',
          icon: FaIcon(
            FontAwesomeIcons.envelope,
            size: 22.0,
            color: _color,
          ),
          errorText: widget.errorUsername,
        ),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        onSubmitted: (String value) {
          FocusScope.of(context).requestFocus(_passwordFocusNode);
        },
      );
}
