import 'package:amidacode/models/usersModel/data_source.dart';
import 'package:amidacode/pages/info_cards.dart';
import 'package:flutter/material.dart';

class Stat extends StatefulWidget {
  const Stat({Key key}) : super(key: key);

  @override
  _StatState createState() => _StatState();
}

class _StatState extends State<Stat> {
  List producerAlim = <dynamic>[];
  List producerAlev = <dynamic>[];
  List transf = <dynamic>[];
  List vendeur = <dynamic>[];
  Future<void> getProdAl() async {
    await DataSource.getInstance.getCurrentData(
        params: {"event": "FIND_PRODUCTEURS_ALIMENT"}).then((data) {
      if (mounted)
        setState(() {
          producerAlim = data;
        });
    }).catchError((onError) {
      print(onError);
    });
  }

  Future<void> getProdAle() async {
    await DataSource.getInstance.getCurrentData(
        params: {"event": "FIND_PRODUCTEURS_ALEVIN"}).then((data) {
      if (mounted)
        setState(() {
          producerAlev = data;
        });
    }).catchError((onError) {
      print(onError);
    });
  }

  Future<void> getTransf() async {
    await DataSource.getInstance
        .getCurrentData(params: {"event": "FIND_TRANSFORMATEURS"}).then((data) {
      if (mounted)
        setState(() {
          transf = data;
        });
    }).catchError((onError) {
      print(onError);
    });
  }

  Future<void> getVendeur() async {
    await DataSource.getInstance
        .getCurrentData(params: {"event": "FIND_VENDEURS"}).then((data) {
      if (mounted)
        setState(() {
          vendeur = data;
        });
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  void initState() {
    super.initState();
    getProdAl();
    getProdAle();
    getTransf();
    getVendeur();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            InfoCard(
              title: "Cages",
              value: "10",
              onTap: () {},
              topColor: Colors.brown,
            ),
            SizedBox(
              height: _width / 64,
            ),
            InfoCard(
              title: "Etangs",
              value: "17",
              topColor: Colors.brown,
              onTap: () {},
            ),
            SizedBox(
              height: 15,
            ),
            InfoCard(
              title: "Producteurs aliments",
              value: producerAlim.length,
              topColor: Colors.brown,
              onTap: () {},
            ),
            SizedBox(
              height: 15,
            ),
            InfoCard(
              title: "Producteurs alevins",
              value: producerAlev.length,
              topColor: Colors.brown,
              onTap: () {},
            ),
            SizedBox(
              height: 15,
            ),
            InfoCard(
              title: "Transformateurs",
              value: transf.length,
              topColor: Colors.brown,
              onTap: () {},
            ),
            SizedBox(
              height: 15,
            ),
            InfoCard(
              title: "Vendeurs",
              value: vendeur.length,
              topColor: Colors.brown,
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
