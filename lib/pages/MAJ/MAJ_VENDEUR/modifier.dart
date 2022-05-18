import 'package:amidacode/models/usersModel/data_source.dart';
import 'package:amidacode/pages/MAJ/MAJ_VENDEUR/table.dart';
import 'package:flutter/material.dart';

class ModifierVendeur extends StatefulWidget {
  const ModifierVendeur({Key key}) : super(key: key);

  @override
  _ModifierVendeurState createState() => _ModifierVendeurState();
}

class _ModifierVendeurState extends State<ModifierVendeur> {
  List vendeur = <dynamic>[];
  Future<void> getITrasns() async {
    await DataSource.getInstance
        .getCurrentData(params: {"event": "FIND_VENDEURS"}).then((data) {
      if (mounted)
        setState(() {
          vendeur = data;
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
                  data: vendeur,
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
