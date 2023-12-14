import 'dart:async'; // Import library untuk Future dan Timer
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    
    // Menunda navigasi ke halaman login selama 5 detik
    Timer(Duration(seconds:60), () {
      //Navigator.pushReplacementNamed(context, "login");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 236, 236),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/movie.png",
              height: 200,
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Text(
                "REFRESH PIKIRAN DULU KUY!!!",
                style: TextStyle(
                  color: Color.fromARGB(255, 209, 42, 42),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            // Container animasi yang sesuai dengan keinginan Anda
            AnimatedContainer(
              duration: Duration(seconds: 60), // Durasi animasi
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                  color: Color.fromARGB(255, 209, 42, 42),
              ),
              child: Text(
                "Let's Go!!!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
