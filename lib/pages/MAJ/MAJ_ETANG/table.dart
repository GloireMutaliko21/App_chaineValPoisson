import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class TableData extends StatefulWidget {
  final titreTable;
  const TableData({Key key, this.titreTable}) : super(key: key);

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
                "Tableau des etangs",
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
                  label: Text('Adresse'),
                ),
                DataColumn2(label: Text('Action'), size: ColumnSize.L),
              ],
              rows: List<DataRow>.generate(
                  4,
                  (index) => DataRow(cells: [
                        DataCell(
                          Text(
                            "1",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataCell(
                          Text(
                            "Lac-kivu",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataCell(
                          Text(
                            "Bukavu",
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
                                border:
                                    Border.all(color: Colors.black, width: .5),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              child: Text(
                                "Modifier",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ), onTap: () {
                          _showDialogEtang(context);
                        }),
                      ]))),
        ],
      ),
    );
  }

  TextEditingController nom = new TextEditingController();
  TextEditingController adresse = new TextEditingController();

  String sexe;

  _showDialogEtang(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text(
              'MODIFIER ETANG',
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
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Adresse',
                          hintText: "Adresse",
                          icon: Icon(Icons.location_on),
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
                    // await initData().then((value) {
                    //   value = true;
                    //   if (value) {
                    //     setState(() {
                    //       initDateCal();
                    //     });
                    //   }
                    // });
                  },
                  color: Colors.orange.shade800)
            ],
          );
        });
  }
}
