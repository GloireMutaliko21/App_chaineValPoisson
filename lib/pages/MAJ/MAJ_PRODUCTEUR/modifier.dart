import 'package:amidacode/models/usersModel/data_source.dart';
import 'package:amidacode/pages/MAJ/MAJ_PRODUCTEUR/table.dart';
import 'package:flutter/material.dart';

class ModifierProduct extends StatefulWidget {
  const ModifierProduct({Key key}) : super(key: key);

  @override
  _ModifierProductState createState() => _ModifierProductState();
}

class _ModifierProductState extends State<ModifierProduct> {
  List producer = <dynamic>[];
  Future<void> getITrasns() async {
    await DataSource.getInstance
        .getCurrentData(params: {"event": "FIND_PRODUCTEURS"}).then((data) {
      if (mounted)
        setState(() {
          producer = data;
        });
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  void initState() {
    super.initState();
    getITrasns();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                    // height: 300,
                    child: SingleChildScrollView(
                        child: TableData(
                  data: producer,
                ))),
                SizedBox(
                  height: 10,
                ),
                // LabelGestion(
                //   label: "Gestion des VATs",
                //   message: "Nouveau VAT",
                //   onPress: () {
                //     _showDialogVAT(context);
                //   },
                // ),
                SizedBox(
                  height: 10,
                ),

                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
