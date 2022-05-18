import 'package:amidacode/models/constantes_class.dart';
import 'package:amidacode/models/usersModel/api.dart';
import 'package:amidacode/models/usersModel/session.dart';
import 'package:amidacode/utils/color.dart';
import 'package:flutter/material.dart';

class AjoutProducer extends StatefulWidget {
  const AjoutProducer({Key key}) : super(key: key);

  @override
  _AjoutProducerState createState() => _AjoutProducerState();
}

TextEditingController nom = new TextEditingController();
TextEditingController postnom = new TextEditingController();
TextEditingController age = new TextEditingController();
TextEditingController num = new TextEditingController();
TextEditingController adresse = new TextEditingController();
var type, sexe;

Future<bool> initData() async {
  await DataInsert.getInstance.addProducer(data: {
    "nomProducteur": nom.text,
    "postnomProducteur": postnom.text,
    "sexeProducteur": sexe.toString().substring(0, 1),
    "ageProducteur": age.text,
    "telephoneProducteur": num.text,
    "adresseProducteur": adresse.text,
    "typeProducteur": type.toString(),
    "idIdentificateur": MyPreferences.idIdentificateur,
  }).then((value) {
    return true;
  });
  return false;
}

void vider() {
  nom.text = "";
  postnom.text = "";
  age.text = "";
  num.text = "";
  adresse.text = "";
}

class _AjoutProducerState extends State<AjoutProducer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: 270,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "AJOUT DES PRODUCTEURS",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      "assets/images/iita.jpg",
                      width: size.width * 0.15,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      validator: (x) =>
                          x.isNotEmpty ? null : "Saisissez le nom",
                      controller: nom,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: "Noms",
                          hintText: "Ex. Amida",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(29))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (x) =>
                          x.isNotEmpty ? null : "Saisissez le post-nom",
                      controller: postnom,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person_add),
                          labelText: "Post-nom",
                          hintText: "Ex. Suzanne",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(29))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        // height: 100,
                        child: cbList(
                            title: "Sexe",
                            list: isList(value: ["Masculin", "Féminin"]),
                            onChanged: (val) {
                              sexe = val;
                            })),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (x) => x.isNotEmpty ? null : "Saisissez l'âge",
                      controller: age,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.calendar_today),
                          labelText: "Age",
                          hintText: "Ex 26 ans ",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(29))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (x) =>
                          x.isNotEmpty ? null : "Numéro téléphone",
                      controller: num,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          labelText: "Téléphone",
                          hintText: "Ex +243 900000000 ",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(29))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        child: cbList(
                            title: "Type producteur",
                            list: isList(value: [
                              "Aliment",
                              "Alevin",
                            ]),
                            onChanged: (val) {
                              setState(() {
                                type = val;
                              });
                            })),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (x) =>
                          x.isNotEmpty ? null : " Saisissez l'adresse",
                      controller: adresse,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.house),
                          labelText: "Adresse",
                          hintText: "Ex. Av.Mbaki/Q. Ndendere ",
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
                                backgroundColor: Colors.orangeAccent.shade700,
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
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
