import 'package:amidacode/models/constantes_class.dart';
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
                "Tableau des producteurs",
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
                  label: Text('Post-nom'),
                ),
                DataColumn2(label: Text('Action'), size: ColumnSize.L),
              ],
              rows: List<DataRow>.generate(widget.data.length, (index) {
                var data = widget.data[index];
                var id = data['idProducteur'];

                // ========== CONTROLLEURS ============
                TextEditingController nom = new TextEditingController();
                TextEditingController postnom = new TextEditingController();
                TextEditingController age = new TextEditingController();
                TextEditingController tel = new TextEditingController();
                TextEditingController adresse = new TextEditingController();

                //============= Initialisation des controllers===================

                nom.text = data['nomProducteur'];
                postnom.text = data['postnomProducteur'];
                age.text = data['ageProducteur'];
                tel.text = data['telephoneProducteur'];
                adresse.text = data['adresseProducteur'];

                //========= Vider les champs ===============

                void vider() {
                  id = "";
                  nom.text = "";
                  postnom.text = "";
                  age.text = "";
                  adresse.text = "";
                  tel.text = "";
                }

                return DataRow(cells: [
                  DataCell(
                    Text(
                      data["idProducteur"],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataCell(
                    Text(
                      data["nomProducteur"],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataCell(
                    Text(
                      data["postnomProducteur"],
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
                              'MODIFIER PRODUCTEUR',
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
                                        initialValue: "${id}",
                                        decoration: InputDecoration(
                                          labelText: 'Identifiant',
                                          enabled: false,
                                          icon: Icon(Icons.account_box),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: nom,
                                        keyboardType: TextInputType.name,
                                        decoration: InputDecoration(
                                          labelText: 'Nom',
                                          hintText: "Nom",
                                          icon: Icon(Icons.account_box),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: postnom,
                                        keyboardType: TextInputType.name,
                                        decoration: InputDecoration(
                                          labelText: 'Post-Nom',
                                          hintText: "Post-Nom",
                                          icon: Icon(Icons.person),
                                        ),
                                      ),
                                      Container(
                                          child: cbList(
                                              title: "Sexe",
                                              list: isList(value: [
                                                "Féminin",
                                                "Masculin"
                                              ]),
                                              onChanged: (val) {
                                                sexe = val;
                                              })),
                                      TextFormField(
                                        controller: age,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          labelText: 'Age',
                                          hintText: "Age",
                                          icon: Icon(Icons.calendar_today),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: tel,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          labelText: 'Numéro tél',
                                          hintText: "Numéro tél",
                                          icon: Icon(Icons.phone),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: adresse,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          labelText: 'Adresse',
                                          hintText: "Adresse",
                                          icon: Icon(Icons.home_work_outlined),
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
                                        .updateProduc(data: {
                                      "idProducteur": id,
                                      "nomProducteur": nom.text,
                                      "postnomProducteur": postnom.text,
                                      "sexeProducteur":
                                          sexe.toString().substring(0, 1),
                                      "ageProducteur": age.text,
                                      "telephoneProducteur": tel.text,
                                      "adresseProducteur": adresse.text,
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
