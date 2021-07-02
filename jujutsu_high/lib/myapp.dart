import 'package:flutter/material.dart';
import 'package:jujutsu_high/pages/create_account.dart';
import 'package:jujutsu_high/pages/error_page.dart';
import 'package:jujutsu_high/pages/home_page.dart';
import 'package:jujutsu_high/pages/login.dart';
import 'package:jujutsu_high/pages/recover_password.dart';
import 'package:jujutsu_high/pages/splash_page.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: LoginPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashPage(),
        '/login': (context) => LoginPage(),
        '/createAccount': (context) => CreateAccount(),
        '/recoverPassword': (context) => RecoverPassword(),
        '/homePage': (context) => HomePage(),
        '/errorPage': (context) => ErrorPage(),
      },
    );
  }
}
