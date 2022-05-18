import 'dart:async';

import 'package:amidacode/pages/login.dart';
import 'package:flutter/material.dart';

class Acceuil extends StatefulWidget {
  @override
  _AcceuilState createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 4000), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Connexion()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(),
        child: Center(
          child: Image.asset(
            "assets/images/iita.jpg",
            width: 130,
            height: 130,
          ),
        ),
      ),
    );
  }
}
