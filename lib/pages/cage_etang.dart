import 'package:amidacode/pages/ajouter_cage.dart';
import 'package:amidacode/pages/ajouter_etang.dart';
import 'package:amidacode/pages/info_cards.dart';
import 'package:flutter/material.dart';

class CageEtang extends StatefulWidget {
  const CageEtang({Key key}) : super(key: key);

  @override
  _CageEtangState createState() => _CageEtangState();
}

class _CageEtangState extends State<CageEtang> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Text(
            "AJOUT DES CAGES ET ETANGS",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18,
                color: Colors.orange.shade900,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          InfoCard(
            title: "AJOUT CAGE",
            value: "",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AJouterCage();
                  },
                ),
              );
            },
            topColor: Colors.brown,
          ),
          SizedBox(
            height: 20,
          ),
          InfoCard(
            title: "AJOUT ETANG",
            value: "",
            topColor: Colors.brown,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AjouterEtangCage();
                  },
                ),
              );
            },
          ),
        ],
      ),
    ));
  }
}
