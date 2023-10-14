import 'package:flutter/material.dart';
import 'package:mystock_master/src/constants/asset.dart';
import 'package:mystock_master/src/pages/home/widgets/custom_drawer.dart';

class HomePage extends StatefulWidget {
  // const HomePage({
  //   super.key,
  //   this.name = 'aaa',
  //   this.age = 20,
  // });
  //
  // final String name;
  // final int age;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    // final Map<Object, Object> arguments = ModalRoute.of(context).settings.arguments;
    // final Map<Object, Object> arguments = ModalRoute.of(context)!.settings.arguments as Map<Object, Object>;
    //
    // final models = Map<String, Object>.from(arguments);
    //
    // Object? name = '';
    // Object? age = 0;
    // if(models['name'] is String){
    //   name = models['name'];
    // }
    // if(models['age'] is int){
    //   age = models['age'];
    // }

    return Scaffold(
      appBar: AppBar(
         title: Text('Stock Workshop'),
      ),
      drawer: CustomDrawer(),
      body: Image.asset(Asset.LOGO_IMAGE),
    );
  }
}
