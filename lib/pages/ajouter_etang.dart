import 'package:amidacode/models/usersModel/api.dart';
import 'package:amidacode/models/usersModel/session.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
// geolocator: ^5.1.5

class AjouterEtangCage extends StatefulWidget {
  const AjouterEtangCage({Key key}) : super(key: key);

  @override
  _AjouterEtangCageState createState() => _AjouterEtangCageState();
}

class _AjouterEtangCageState extends State<AjouterEtangCage> {
  TextEditingController nom = new TextEditingController();
  TextEditingController adresse = new TextEditingController();
  var prod;
  var longitude;
  var latitude;

  void getCurrentLocation() async {
    var position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator().getLastKnownPosition();
    print(lastPosition);

    setState(() {
      longitude = position.longitude;
      latitude = position.latitude;
    });
  }

  Future<bool> initData() async {
    await DataInsert.getInstance.addEtang(data: {
      "nomEtang": nom.text,
      "ville_territoire": adresse.text,
      "longitude": longitude,
      "latitude": latitude,
      "idIdentificateur": MyPreferences.idIdentificateur,
    }).then((value) {
      return true;
    });
    return false;
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Center(
                child: Container(
                  width: 270,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "AJOUTER DES ETANGS",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.orange),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: nom,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: 'Nom',
                          hintText: "Nom",
                          icon: Icon(Icons.water),
                        ),
                      ),
                      TextFormField(
                        controller: adresse,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'Adresse',
                          hintText: "Adresse",
                          icon: Icon(Icons.location_on),
                        ),
                      ),

                      SizedBox(
                        height: 30,
                      ), //o27qHO6zG@Tf*m2Yqras
                      RaisedButton(
                          child: Text(
                            "Enregistrer",
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () async {
                            print("Longitude =========== ${longitude}");
                            print("Latitude =========== ${latitude}");
                            print(
                                "idIdentif =========== ${MyPreferences.idIdentificateur}");

                            await initData();
                          },
                          color: Colors.orange.shade800)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
