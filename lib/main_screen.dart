import 'package:amidacode/pages/MAJ/MAJ_IDENTIFCATEUR/modifier.dart';
import 'package:amidacode/pages/accueilAdmin.dart';
import 'package:amidacode/pages/geolocalisation_data.dart';
import 'package:amidacode/pages/login.dart';
import 'package:amidacode/pages/stat.dart';
import 'package:amidacode/rapports/page/pdf_page.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  final VoidCallback logOut;
  const MainScreen({Key key, @required this.logOut}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final screen = [AccueilAdmin(), GeoLocData(), Stat(), ModifierIdentif()];

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
                  leading: Icon(Icons.logout,
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
                      setState(() {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (builder) => Connexion(),
                          ),
                          (route) => false,
                        );
                      });
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
            Icon(Icons.location_on, color: Colors.orange.shade900),
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
