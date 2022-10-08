import 'package:flutter/material.dart';
import 'package:apidatabase/View/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:apidatabase/controller/controller_class.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'flutter Demo',
        theme: ThemeData(
        primarySwatch: Colors.pink,
    ),
    home: ChangeNotifierProvider(
    create: (context)=> controllersData(),
    child: HomeScreen()
    ),
    );
  }
}