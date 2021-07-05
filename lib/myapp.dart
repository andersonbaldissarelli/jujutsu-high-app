import 'package:flutter/material.dart';
import 'package:jujutsu_high/pages/create_account/create_account.dart';

import 'package:jujutsu_high/pages/home/home_page.dart';
import 'package:jujutsu_high/pages/login/login.dart';
import 'package:jujutsu_high/pages/recovery_password/recovery_password.dart';
import 'package:jujutsu_high/pages/splash/splash_page.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashPage(),
        '/login': (context) => LoginPage(),
        '/create_account': (context) => CreateAccount(),
        '/recovery_password': (context) => RecoveryPassword(),
        '/home_page': (context) => HomePage(),
      },
    );
  }
}
