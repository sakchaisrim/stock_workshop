import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mystock_master/src/config/theme.dart' as custom_theme;

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: FormInput(),
        ),
      );

  Container _buldSubmitFormButton() => Container(
        width: 220,
        height: 50,
        decoration: _BoxDecoration(),
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
}

class FormInput extends StatelessWidget {
  final _color = Colors.black54;

  const FormInput({
    super.key,
  });

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
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: 'Password',
          labelStyle: _textStyle(),
          icon: FaIcon(
            FontAwesomeIcons.lock,
            size: 22.0,
            color: _color,
          ),
        ),
        obscureText: true,
      );

  TextField _buildUserName() => TextField(
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
        ),
      );
}
