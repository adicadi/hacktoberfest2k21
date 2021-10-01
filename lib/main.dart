import 'package:flutter/material.dart';
import 'package:hacktoberfest2k21/users.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HacktoberFest2k21',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: UsersList(),
    );
  }
}
