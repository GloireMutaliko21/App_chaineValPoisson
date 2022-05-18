import 'package:amidacode/models/usersModel/session.dart';
import 'package:amidacode/models/usersModel/updates.dart';
import 'package:amidacode/pages/accueilidenti.dart';
import 'package:amidacode/pages/cage_etang.dart';
import 'package:amidacode/pages/login.dart';
import 'package:amidacode/pages/miseajour.dart';
import 'package:amidacode/pages/stat.dart';
import 'package:amidacode/rapports/page/pdf_page.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MainScreenIdenti extends StatefulWidget {
  final VoidCallback logOut;
  const MainScreenIdenti({Key key, this.logOut}) : super(key: key);

  @override
  _MainScreenIdentiState createState() => _MainScreenIdentiState();
}

class _MainScreenIdentiState extends State<MainScreenIdenti> {
  int selectedIndex = 0;

  final screen = [Accueilidenti(), CageEtang(), Stat(), Miseajour()];

  TextEditingController nom =
      new TextEditingController(text: MyPreferences.nom);

  TextEditingController login =
      new TextEditingController(text: MyPreferences.login);
  TextEditingController mdp =
      new TextEditingController(text: MyPreferences.mdp);

  TextEditingController adresse =
      new TextEditingController(text: MyPreferences.adresse);

  TextEditingController age =
      new TextEditingController(text: MyPreferences.age);

  TextEditingController telephone =
      new TextEditingController(text: MyPreferences.telephone);

  void vider() {
    nom.text = "";
    login.text = "";
    mdp.text = "";
    adresse.text = "";
    age.text = "";
    telephone.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screen[selectedIndex],
        drawer: Drawer(
          child: Material(
            // color: Color.fromRGBO(50, 75, 205, 1),
            color: Colors.white,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10),
              children: <Widget>[
                DrawerHeader(
                  child: Row(children: <Widget>[
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(
                        "assets/images/iita.jpg",
                      ),
                      backgroundColor: Color.fromRGBO(30, 60, 168, 1),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 45,
                        ),
                        Text(
                          "Fish",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.orange.shade900,
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "janvierna@gmail.com",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.orange.shade900,
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
                Divider(
                  color: Colors.black,
                ),
                ListTile(
                  leading: Icon(Icons.person,
                      color: Colors.orange.shade900, size: 20),
                  title: Text(
                    "Mon compte",
                    style:
                        TextStyle(color: Colors.orange.shade900, fontSize: 16),
                  ),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            scrollable: true,
                            title: Text(
                              "MON COMPTE",
                              textAlign: TextAlign.center,
                            ),
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Form(
                                child: Container(
                                  width: 400,
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        initialValue:
                                            MyPreferences.idIdentificateur,
                                        decoration: InputDecoration(
                                            enabled: false,
                                            labelText: 'Mon identifiant',
                                            icon: Icon(
                                              Icons.security,
                                              color: Colors.brown,
                                            )),
                                      ),
                                      TextFormField(
                                        controller: nom,
                                        validator: (x) => x.isNotEmpty
                                            ? null
                                            : "Saisissez votre nom",
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                            labelText: 'Nom complet',
                                            hintText: "Votre nom",
                                            icon: Icon(
                                              Icons.person,
                                              color: Colors.brown,
                                            )),
                                      ),
                                      TextFormField(
                                        controller: login,
                                        validator: (x) => x.isNotEmpty
                                            ? null
                                            : "Saisissez votre login",
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          labelText: 'Login',
                                          hintText: "Login",
                                          icon: Icon(
                                            Icons.phone_callback_rounded,
                                            color: Colors.brown,
                                          ),
                                        ),
                                      ),
                                      TextFormField(
                                        obscureText: true,
                                        controller: mdp,
                                        validator: (x) => x.isNotEmpty
                                            ? null
                                            : "Saisissez votre mot de passe",
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          labelText: 'Mot de passe',
                                          hintText: "*************",
                                          icon: Icon(
                                            Icons.home_work_outlined,
                                            color: Colors.brown,
                                          ),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: adresse,
                                        validator: (x) => x.isNotEmpty
                                            ? null
                                            : "Saisissez votre adresse",
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          labelText: 'Adresse',
                                          hintText: "Adresse",
                                          icon: Icon(
                                            Icons.person_pin,
                                            color: Colors.brown,
                                          ),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: age,
                                        validator: (x) => x.isNotEmpty
                                            ? null
                                            : "Saisissez votre age",
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          labelText: 'Age',
                                          hintText: "age",
                                          icon: Icon(
                                            Icons.lock,
                                            color: Colors.brown,
                                          ),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: telephone,
                                        validator: (x) => x.isNotEmpty
                                            ? null
                                            : "Saisissez votre numéro",
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          labelText: 'Numéro tel',
                                          hintText: "Numéro tel",
                                          icon: Icon(
                                            Icons.lock,
                                            color: Colors.brown,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            actions: [
                              RaisedButton(
                                child: Text(
                                  "Modifier",
                                  style: TextStyle(color: Colors.black),
                                ),
                                onPressed: () async {
                                  await DataUpdate.getInstance
                                      .updateIndentif(data: {
                                    "idIdentificateur":
                                        MyPreferences.idIdentificateur,
                                    "nom_complet": nom.text,
                                    "login": login.text,
                                    "mdp": mdp.text,
                                    "adresse": adresse.text,
                                    "age": age.text,
                                    "telephone": telephone.text,
                                  }).then((value) {
                                    vider();
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            content:
                                                Text("Modifié avec succès"),
                                          );
                                        });
                                    print(value);
                                  });
                                },
                                color: Colors.orange.shade900,
                              )
                            ],
                          );
                        });
                  },
                ),
                ListTile(
                  leading: Icon(Icons.my_library_books_rounded,
                      color: Colors.orange.shade900, size: 20),
                  title: Text(
                    "Etats de sortie",
                    style:
                        TextStyle(color: Colors.orange.shade900, fontSize: 16),
                  ),
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return PdfPage();
                          },
                        ),
                      );
                    });
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout,
                      color: Colors.orange.shade900, size: 20),
                  title: Text(
                    "Deconnexion",
                    style:
                        TextStyle(color: Colors.orange.shade900, fontSize: 16),
                  ),
                  onTap: () {
                    setState(() {
                      widget.logOut.call();
                    });
                  },
                ),
                ListTile(
                  leading: Icon(Icons.contact_mail_outlined,
                      color: Colors.orange.shade900, size: 20),
                  title: Text(
                    "Contactez-nous",
                    style:
                        TextStyle(color: Colors.orange.shade900, fontSize: 16),
                  ),
                  onTap: () {
                    // _showNotification();
                  },
                  onLongPress: () {
                    // _showNotification();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.info_outline,
                      color: Colors.orange.shade900, size: 20),
                  title: Text(
                    "A propos",
                    style:
                        TextStyle(color: Colors.orange.shade900, fontSize: 16),
                  ),
                  onTap: () {},
                ),
                Divider(
                  color: Colors.orange.shade900,
                ),
                ListTile(
                  leading: Icon(
                    Icons.help_outline,
                    color: Colors.orange.shade900,
                    size: 20,
                  ),
                  title: Text(
                    "Aide",
                    style:
                        TextStyle(color: Colors.orange.shade900, fontSize: 16),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          // leading: Icon(Icons.menu),
          backgroundColor: Colors.orange.shade900,
          toolbarHeight: 35,
          centerTitle: true,
          title: Text(
            "Menu principal",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          items: [
            Icon(
              Icons.person,
              color: Colors.orange.shade900,
            ),
            Icon(Icons.water, color: Colors.orange.shade900),
            Icon(Icons.file_copy_rounded, color: Colors.orange.shade900),
            Icon(Icons.update_rounded, color: Colors.orange.shade900),
          ],
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          backgroundColor: Colors.brown.withOpacity(0.3),
          color: Colors.white,
          height: 45,
          animationCurve: Curves.easeOutBack,
        ),
      ),
    );
  }
}
