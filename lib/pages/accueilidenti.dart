import 'package:amidacode/pages/Ajout_Acteurs/ajout_producer.dart';
import 'package:amidacode/pages/Ajout_Acteurs/ajout_transform.dart';
import 'package:amidacode/pages/Ajout_Acteurs/ajout_vendeur.dart';
import 'package:amidacode/pages/info_cards.dart';
import 'package:flutter/material.dart';

class Accueilidenti extends StatefulWidget {
  const Accueilidenti({Key key}) : super(key: key);

  @override
  _AccueilidentiState createState() => _AccueilidentiState();
}

class _AccueilidentiState extends State<Accueilidenti> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Text(
            "INSCRIPTION DES ACTEURS",
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
            title: "AJOUT PRODUCTEUR",
            value: "",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AjoutProducer();
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
            title: "AJOUT TRANSFORMATEUR",
            value: "",
            topColor: Colors.brown,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AjoutTransform();
                  },
                ),
              );
            },
          ),
          SizedBox(
            height: 30,
          ),
          InfoCard(
            title: "AJOUT VENDEUR",
            value: "",
            topColor: Colors.brown,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AjoutVendeur();
                  },
                ),
              );
            },
          ),
        ],
      )),
    ));
  }
}
