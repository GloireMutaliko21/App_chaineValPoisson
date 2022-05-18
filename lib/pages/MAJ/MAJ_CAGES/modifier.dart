import 'package:amidacode/pages/MAJ/MAJ_CAGES/table.dart';
import 'package:flutter/material.dart';

class ModifierCage extends StatefulWidget {
  const ModifierCage({Key key}) : super(key: key);

  @override
  _ModifierCageState createState() => _ModifierCageState();
}

class _ModifierCageState extends State<ModifierCage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 300,
                  child: SingleChildScrollView(
                      child: TableData(
                    titreTable: "Liste des etangs",
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
    );
  }
}
