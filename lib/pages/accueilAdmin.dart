import 'package:amidacode/models/constantes_class.dart';
import 'package:amidacode/models/usersModel/api.dart';
import 'package:amidacode/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AccueilAdmin extends StatefulWidget {
  const AccueilAdmin({Key key}) : super(key: key);

  @override
  _AccueilAdminState createState() => _AccueilAdminState();
}

TextEditingController nom = new TextEditingController();
TextEditingController age = new TextEditingController();
TextEditingController num = new TextEditingController();
TextEditingController adresse = new TextEditingController();
var sexe;

Future<bool> initData() async {
  await DataInsert.getInstance.addIndentif(data: {
    "nom_complet": nom.text,
    "login": nom.text,
    "mdp": num.text,
    "sexe": sexe.toString().substring(0, 1),
    "adresse": adresse.text,
    "age": age.text,
    "telephone": num.text,
  }).then((value) {
    return true;
  });
  return false;
}

void vider() {
  nom.text = "";
  age.text = "";
  num.text = "";
  adresse.text = "";
}

class _AccueilAdminState extends State<AccueilAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    "AJOUT DES IDENTIFICATEURS",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.orange.shade900,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Container(
                      width: 270,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            // margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(vertical: 2),
                            child: TextFormField(
                              validator: (x) => x.isNotEmpty
                                  ? null
                                  : "saisissez le nom complet",
                              controller: nom,
                              keyboardType: TextInputType.text,
                              inputFormatters: <TextInputFormatter>[
                                WhitelistingTextInputFormatter(
                                    RegExp("[a-zA-ZÄäÖöÜü]"))
                              ],
                              style: TextStyle(),
                              decoration: InputDecoration(
                                labelText: "Nom",
                                hintText: "Ex. Georges Depay",
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(29)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                              child: cbList(
                                  title: "Sexe",
                                  list: isList(value: ["Masculin", "Féminin"]),
                                  onChanged: (val) {
                                    sexe = val;
                                  })),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            validator: (x) =>
                                x.isNotEmpty ? null : "Saisissez l'age",
                            controller: age,
                            keyboardType: TextInputType.number,
                            maxLength: 2,
                            inputFormatters: <TextInputFormatter>[
                              WhitelistingTextInputFormatter(RegExp("[0-9]"))
                            ],
                            decoration: InputDecoration(
                                counterText: '',
                                prefixIcon: Icon(Icons.calendar_today),
                                labelText: "Age",
                                hintText: "Ex. 26",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(29))),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            validator: (x) =>
                                x.isNotEmpty ? null : "Numero de telephone",
                            controller: num,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.phone),
                                labelText: "Numero de telephone",
                                hintText: "Ex. +24300000000",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(29))),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            validator: (x) => x.isNotEmpty ? null : "Adresse",
                            controller: adresse,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.home),
                                labelText: "Adresse",
                                hintText: "Ex.Province/ville/territoire ",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(29))),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          MaterialButton(
                              onPressed: () async {
                                await initData().then((value) {
                                  value = true;
                                  if (value) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                        "Enregistré avec succès",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                        textAlign: TextAlign.center,
                                      ),
                                      backgroundColor:
                                          Colors.orangeAccent.shade700,
                                    ));
                                    vider();
                                  }
                                });
                              },
                              height: 60,
                              textColor: Colors.white,
                              color: orangeColors,
                              minWidth: double.infinity,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              child: Text(
                                "Inscrire",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
