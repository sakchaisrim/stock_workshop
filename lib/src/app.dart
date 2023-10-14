import 'package:flutter/material.dart';
import 'package:mystock_master/src/constants/setting.dart';
import 'package:mystock_master/src/pages/home/home_page.dart';
import 'package:mystock_master/src/pages/login/login_page.dart';
import 'package:mystock_master/src/config/route.dart' as custom_route;
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: custom_route.Route.getAll(),
      title: 'MyStock',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            final token = snapshot.data?.getString(Setting.TOKEN_PREF) ?? '';
            if(token.isNotEmpty){
              return HomePage();
            }
            return LoginPage();
          }
          return SizedBox();
        },
      ),
    );
  }
}
