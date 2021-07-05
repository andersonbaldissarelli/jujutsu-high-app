import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Color(0XFF011629),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              alignment: Alignment.topLeft,
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  colors: <Color>[
                    Color(0XFF50518F),
                    Color(0XFF262432),
                  ],
                ),
              ),
            ),
            Text(
              "Jujutsu Sorcery School",
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  colors: <Color>[
                    Color(0XFF262432),
                    Color(0XFF50518F),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
