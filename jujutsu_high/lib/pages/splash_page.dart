import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initializeFirebase() async {
    try {
      await Firebase.initializeApp();
      Navigator.pushNamed(context, '/login');
    } catch (e) {
      Navigator.pushNamed(context, '/errorPage');
    }
  }

  @override
  void initState() {
    initializeFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.topLeft,
              width: 300,
              height: 200,
              color: Color(0XFF262432),
            ),
            Text(
              "Jujutsu Sorcery School",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              width: 300,
              height: 200,
              color: Color(0XFF50518F),
            ),
          ],
        ),
      ),
    );
  }
}
