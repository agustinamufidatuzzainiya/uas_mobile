import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cinescoopApp/session/login.dart';

class AppBarWidget extends StatelessWidget {
  AppBarWidget({Key? key}) : super(key: key);
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 15,
      ),
      color: Color.fromARGB(255, 198, 69, 69), // Ganti dengan warna yang diinginkan
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              _auth.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  login()),
              );
            },
            child: Container(
              padding:  EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset:  Offset(0, 3),
                  ),
                ],
              ),
              child:  Icon(CupertinoIcons.back),
            ),
          ),
          InkWell(
            onTap: () {
              _auth.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  login()),
              );
            },
            child: Container(
              padding:  EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset:  Offset(0, 3),
                  ),
                ],
              ),
              child:  Icon(
                Icons.logout,
                color: Colors.black, // Sesuaikan warna dengan kebutuhan Anda
              ),
            ),
          ),
        ],
      ),
    );
  }
}

