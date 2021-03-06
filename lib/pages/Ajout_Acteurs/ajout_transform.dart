import 'package:amidacode/models/constantes_class.dart';
import 'package:amidacode/models/usersModel/api.dart';
import 'package:amidacode/models/usersModel/session.dart';
import 'package:amidacode/utils/color.dart';
import 'package:flutter/material.dart';

class AjoutTransform extends StatefulWidget {
  const AjoutTransform({Key key}) : super(key: key);

  @override
  _AjoutTransformState createState() => _AjoutTransformState();
}

TextEditingController nom = new TextEditingController();
TextEditingController postnom = new TextEditingController();
TextEditingController age = new TextEditingController();
TextEditingController num = new TextEditingController();
TextEditingController adresse = new TextEditingController();
var type, sexe;

Future<bool> initData() async {
  await DataInsert.getInstance.addTransform(data: {
    "nomTransformateur": nom.text,
    "postnomTransformateur": postnom.text,
    "sexeTransformateur": sexe.toString().substring(0, 1),
    "ageTransformateur": age.text,
    "telephoneTransformateur": num.text,
    "adresseTransformateur": adresse.text,
    "typeTransformateur": type.toString(),
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

class _AjoutTransformState extends State<AjoutTransform> {
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
                      "AJOUT DES TRANSFORMATEURS",
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
                            list: isList(value: ["Masculin", "F??minin"]),
                            onChanged: (val) {
                              sexe = val;
                            })),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (x) => x.isNotEmpty ? null : "Saisissez l'age",
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
                          x.isNotEmpty ? null : "Num??ro t??l??phone",
                      controller: num,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          labelText: "T??l??phone",
                          hintText: "Ex +243 900000000 ",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(29))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        child: cbList(
                            title: "Type transformateur",
                            list: isList(value: [
                              "De poisson fum??",
                              "De poisson sal??",
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
                                  "Enregistr?? avec succ??s",
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
