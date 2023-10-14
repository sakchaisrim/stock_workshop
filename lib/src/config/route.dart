import 'package:flutter/material.dart';
import 'package:mystock_master/src/pages/pages.dart';

class Route{
  static const home = '/home';
  static const login = '/login';

  static Map<String, WidgetBuilder> getAll() => _route;

  static final Map<String, WidgetBuilder> _route = {
    home : (context) => HomePage(),
    login : (context) => LoginPage(),
  };
}