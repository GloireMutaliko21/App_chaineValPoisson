import 'package:amidacode/models/usersModel/updates.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class TableData extends StatefulWidget {
  final titreTable;
  final List data;
  const TableData({Key key, this.titreTable, this.data}) : super(key: key);

  @override
  _TableDataState createState() => _TableDataState();
}

class _TableDataState extends State<TableData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 550,
      // alignment: Alignment.topRight,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.orangeAccent, width: .5),
        boxShadow: [
          BoxShadow(offset: Offset(0, 6), color: Colors.black, blurRadius: 12)
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.only(
        bottom: 15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                "Tableau des identificateurs",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          DataTable2(
              columnSpacing: 5,
              horizontalMargin: 5,
              columns: [
                DataColumn2(
                  label: Text("Id"),
                  size: ColumnSize.S,
                ),
                DataColumn(
                  label: Text('Noms'),
                ),
                DataColumn(
                  label: Text('Sexe'),
                ),
                DataColumn2(label: Text('Action'), size: ColumnSize.L),
              ],
              rows: List<DataRow>.generate(widget.data.length, (index) {
                var data = widget.data[index];
                var idIdentificateur = data['idIdentificateur'];

                //========= Controllers avec des valeurs initiales ==============
                TextEditingController nom = new TextEditingController();
                TextEditingController log = new TextEditingController();
                TextEditingController pw = new TextEditingController();
                TextEditingController age = new TextEditingController();
                TextEditingController tel = new TextEditingController();
                TextEditingController adresse = new TextEditingController();
                void vider() {
                  idIdentificateur = "";
                  nom.text = "";
                  log.text = "";
                  pw.text = "";
                  age.text = "";
                  adresse.text = "";
                  tel.text = "";
                }

                nom.text = data['nom_complet'];
                log.text = data['login'];
                pw.text = data['mdp'];
                age.text = data['age'];
                tel.text = data['telephone'];
                adresse.text = data['adresse'];
                return DataRow(cells: [
                  DataCell(
                    Text(
                      data["idIdentificateur"],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataCell(
                    Text(
                      data["nom_complet"],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataCell(
                    Text(
                      data["sexe"],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataCell(
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.orange.shade800,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black, width: .5),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        child: Text(
                          "Modifier",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ), onTap: () {
                    // _showDialogIdentif(context);
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            scrollable: true,
                            title: Text(
                              'MODIFIER IDENTIFICATEUR',
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
                                        enabled: false,
                                        // controller: nom,
                                        initialValue: "${idIdentificateur}",
                                        keyboardType: TextInputType.name,
                                        decoration: InputDecoration(
                                            labelText: 'Identifiant',
                                            icon: Icon(Icons.settings)),
                                      ),
                                      TextFormField(
                                        controller: nom,
                                        // initialValue: data["nom_complet"],
                                        keyboardType: TextInputType.name,
                                        decoration: InputDecoration(
                                          labelText: 'Nom complet',
                                          hintText: "Nom complet",
                                          icon: Icon(Icons.account_box),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller: age,
                                        // initialValue: data["age"],
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          labelText: 'Age',
                                          hintText: "Age",
                                          icon: Icon(Icons.calendar_today),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: tel,
                                        // initialValue: data["telephone"],
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          labelText: 'Numéro tél',
                                          hintText: "Numéro tél",
                                          icon: Icon(Icons.phone),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: adresse,
                                        // initialValue: data["adresse"],

                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          labelText: 'Adresse',
                                          hintText: "Adresse",
                                          icon: Icon(Icons.home_work_outlined),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: log,
                                        // initialValue: data["login"],
                                        keyboardType: TextInputType.name,
                                        decoration: InputDecoration(
                                          labelText: 'Login',
                                          hintText: "Login",
                                          icon: Icon(Icons.person),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: pw,
                                        // initialValue: data["mdp"],
                                        keyboardType: TextInputType.name,
                                        decoration: InputDecoration(
                                          labelText: 'Password',
                                          hintText: "Password",
                                          icon: Icon(Icons.lock),
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
                                      "idIdentificateur": idIdentificateur,
                                      "nom_complet": nom.text,
                                      "login": log.text,
                                      "mdp": pw.text,
                                      "adresse": adresse.text,
                                      "age": age.text,
                                      "telephone": tel.text,
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
                                      return true;
                                    });
                                  },
                                  color: Colors.orange.shade800)
                            ],
                          );
                        });
                  }),
                ]);
              }).toList()),
        ],
      ),
    );
  }

  String sexe;
}
