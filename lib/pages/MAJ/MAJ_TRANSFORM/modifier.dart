import 'package:amidacode/models/usersModel/data_source.dart';
import 'package:amidacode/pages/MAJ/MAJ_TRANSFORM/table.dart';
import 'package:flutter/material.dart';

class ModifierTransf extends StatefulWidget {
  const ModifierTransf({Key key}) : super(key: key);

  @override
  _ModifierTransfState createState() => _ModifierTransfState();
}

class _ModifierTransfState extends State<ModifierTransf> {
  List transf = <dynamic>[];
  Future<void> getITrasns() async {
    await DataSource.getInstance
        .getCurrentData(params: {"event": "FIND_TRANSFORMATEURS"}).then((data) {
      if (mounted)
        setState(() {
          transf = data;
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
                    height: 300,
                    child: SingleChildScrollView(
                        child: TableData(
                      data: transf,
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
