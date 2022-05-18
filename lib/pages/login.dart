import 'dart:convert';
import 'dart:ui';
import 'package:amidacode/main_screen.dart';
import 'package:amidacode/main_screen_identi.dart';
import 'package:amidacode/models/constantes_class.dart';
import 'package:amidacode/models/usersModel/session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:amidacode/utils/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Connexion extends StatefulWidget {
  @override
  _ConnexionState createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  TextEditingController loginu = new TextEditingController();
  TextEditingController mdpu = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String erreur = "";
  bool isLoad = false;

  // int statusAd = 0;
  int statusId = 0;

  Future<void> initSession() async {
    await MyPreferences.getInit.getPresistence().then((value) {
      setState(() {
        statusId = ifExist;
        // statusAd = ifExist;
      });
    });
  }

  int get ifExist {
    print("${MyPreferences.idIdentificateur}");
    if (MyPreferences.idIdentificateur != null) {
      return 1;
    } else {
      return 0;
    }
  }

  Future<void> logOut() async {
    SharedPreferences p = await SharedPreferences.getInstance();
    setState(() {
      p.remove("idIdentificateur");
      statusId = 0;
      p.commit();
    });
    print(statusId);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (builder) => Connexion(),
      ),
      (route) => false,
    );
  }

  Future<String> login({var data}) async {
    try {
      final response = await http.post(
          Uri.parse("https://iitaapp.000webhostapp.com/IITAapp/Login.php"),
          body: jsonEncode(data));

      if (response.statusCode == 200) {
        var resultat = await jsonDecode(response.body);
        print(resultat);
        if (resultat.length > 0) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (builder) => MainScreen(
                logOut: () {},
              ),
            ),
            (route) => false,
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "Echec de connexion",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.orange.shade900,
          ));
        }
      }
    } catch (_) {
      print("${_.toString()}");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Echec de connexion",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.orange,
      ));
    }
    return null;
  }

  Future<String> loginIdentif({var data}) async {
    try {
      final response = await http.post(
          Uri.parse(
              "https://iitaapp.000webhostapp.com/IITAapp/LoginIdentif.php"),
          body: jsonEncode(data));

      if (response.statusCode == 200) {
        var resultat = await jsonDecode(response.body);
        print(resultat);
        if (resultat.length > 0) {
          await MyPreferences.getInit.setPresistence(resultat).then((value) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (builder) => MainScreenIdenti(
                  logOut: () {},
                ),
              ),
              (route) => false,
            );
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "Echec de connexion",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.orange.shade900,
          ));
        }
      }
    } catch (_) {
      print("${_.toString()}");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Echec de connexion",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.orange,
      ));
    }
    return null;
  }

  initData() async {
    setState(() {
      isLoad = true;
    });
    await login(data: {
      "login": loginu.text,
      "mdp": mdpu.text,
    }).then((value) {
      initSession();
      setState(() {
        isLoad = false;
      });
      print(value);
    });
    isLoad = false;
  }

  initDataIdentif() async {
    setState(() {
      isLoad = true;
    });
    await loginIdentif(data: {
      "login": loginu.text,
      "mdp": mdpu.text,
    }).then((value) {
      initSession();
      setState(() {
        isLoad = false;
      });
      print(value);
    });
    isLoad = false;
  }

  @override
  void initState() {
    super.initState();
    initSession();
  }

  bool obscure = true;
  Icon ic = Icon(Icons.remove_red_eye);
  @override
  Widget build(BuildContext context) {
    var type;
    switch (statusId) {
      case 0:
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 80),
                      Text(
                        "IITA",
                        textAlign: TextAlign.center,
                        textScaleFactor: 1.3,
                        style: TextStyle(
                          fontSize: 50,
                          color: orangeColors,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 40),
                      Container(
                          // height: 100,
                          child: cbList(
                              title: "Type de connexion",
                              list: isList(
                                  value: ["Administrateur", "Identificateur"]),
                              onChanged: (val) {
                                type = val;
                              })),
                      SizedBox(height: 40),
                      TextFormField(
                        controller: loginu,
                        validator: (x) =>
                            x.isNotEmpty ? null : "Saisissez votre login",
                        decoration: InputDecoration(
                            hintText: "Login",
                            prefixIcon: Icon(Icons.login_rounded),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12))),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: mdpu,
                        obscureText: obscure,
                        validator: (x) =>
                            x.isNotEmpty ? null : "Saisissez votre passWord",
                        decoration: InputDecoration(
                            hintText: "PassWord",
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (obscure) {
                                      obscure = false;
                                      ic = Icon(Icons.lock_open);
                                    } else {
                                      obscure = true;
                                      ic = Icon(Icons.remove_red_eye);
                                    }
                                  });
                                },
                                icon: ic),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12))),
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: isLoad
                            ? Container(
                                width: 60,
                                height: 60,
                                color: Colors.white,
                                child: Center(
                                  child: SpinKitChasingDots(
                                    color: Colors.orange.shade900,
                                  ),
                                ),
                              )
                            : MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    type == "Administrateur"
                                        ? initData()
                                        : initDataIdentif();
                                  });
                                },
                                height: 40,
                                textColor: Colors.white,
                                color: orangeColors,
                                minWidth: 20,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                child: Text(
                                  "Connexion",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                      ),
                      SizedBox(height: 20),
                      Text(
                        erreur,
                        style: TextStyle(
                            color: orangeColors,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
        break;
      case 1:
        return MainScreenIdenti(logOut: () async {
          await logOut();
        });
        break;
      default:
    }
    return Scaffold();
  }
}
