import 'package:cinescoopApp/dashboard.dart';
import 'package:cinescoopApp/firebase/firebase_options.dart';
import 'package:cinescoopApp/session/login.dart';
import 'package:cinescoopApp/session/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agustina Mufidatuzzainiya',
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Dashboard();
          } else {
            return SplashScreen(); // Ubah ini menjadi SplashScreen yang telah diperbarui
          }
        },
      ),
    );
  }
}
