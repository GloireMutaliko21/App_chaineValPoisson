import 'package:amidacode/models/usersModel/data_source.dart';
import 'package:amidacode/pages/MAJ/MAJ_IDENTIFCATEUR/table.dart';
import 'package:flutter/material.dart';

class ModifierIdentif extends StatefulWidget {
  const ModifierIdentif({Key key}) : super(key: key);

  @override
  _ModifierIdentifState createState() => _ModifierIdentifState();
}

class _ModifierIdentifState extends State<ModifierIdentif> {
  List agent = <dynamic>[];
  Future<void> getIdentif() async {
    await DataSource.getInstance
        .getCurrentData(params: {"event": "FIND_IDENTIFICATEURS"}).then((data) {
      if (mounted)
        setState(() {
          agent = data;
        });
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  void initState() {
    super.initState();
    getIdentif();
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
                  data: agent,
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
