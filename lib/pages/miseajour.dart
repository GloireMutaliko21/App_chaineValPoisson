import 'package:amidacode/models/usersModel/data_source.dart';
import 'package:amidacode/pages/MAJ/MAJ_CAGES/modifier.dart';
import 'package:amidacode/pages/MAJ/MAJ_ETANG/modifier.dart';
import 'package:amidacode/pages/MAJ/MAJ_PRODUCTEUR/modifier.dart';
import 'package:amidacode/pages/MAJ/MAJ_TRANSFORM/modifier.dart';
import 'package:amidacode/pages/MAJ/MAJ_VENDEUR/modifier.dart';
import 'package:amidacode/pages/info_cards.dart';
import 'package:flutter/material.dart';

class Miseajour extends StatefulWidget {
  const Miseajour({Key key}) : super(key: key);

  @override
  _MiseajourState createState() => _MiseajourState();
}

class _MiseajourState extends State<Miseajour> {
  List agent = <dynamic>[];
  Future<void> getIdentif() async {
    await DataSource.getInstance
        .getCurrentData(params: {"event": "FIND_IDENTIFICATEURS"}).then((data) {
      if (mounted)
        setState(() {
          agent = data;
        });
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  void initState() {
    super.initState();
    getIdentif();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Text(
            "MISE A JOUR",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18,
                color: Colors.orange.shade900,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          InfoCard(
            title: "MAJ etangs",
            value: "",
            topColor: Colors.brown,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ModifierEtang();
                  },
                ),
              );
            },
          ),
          SizedBox(
            height: 15,
          ),
          InfoCard(
            title: "MAJ cages",
            value: "",
            topColor: Colors.brown,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ModifierCage();
                  },
                ),
              );
            },
          ),
          SizedBox(
            height: 15,
          ),
          InfoCard(
            title: "MAJ transformateurs",
            value: "",
            topColor: Colors.brown,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ModifierTransf();
                  },
                ),
              );
            },
          ),
          SizedBox(
            height: 15,
          ),
          InfoCard(
            title: "MAJ vendeurs",
            value: "",
            topColor: Colors.brown,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ModifierVendeur();
                  },
                ),
              );
            },
          ),
          SizedBox(
            height: 15,
          ),
          InfoCard(
            title: "MAJ producteurs",
            value: "",
            topColor: Colors.brown,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ModifierProduct();
                  },
                ),
              );
            },
          ),
          SizedBox(
            height: 15,
          ),
        ],
      )),
    );
  }
}
