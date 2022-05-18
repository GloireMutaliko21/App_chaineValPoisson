import 'package:amidacode/main.dart';
import 'package:amidacode/rapports/identif.dart';
import 'package:amidacode/rapports/prodAlm.dart';
import 'package:amidacode/rapports/prodAlv.dart';
import 'package:amidacode/rapports/transformateur.dart';
import 'package:amidacode/rapports/vendeurs.dart';
import 'package:amidacode/rapports/widget/button_widget.dart';
import 'package:amidacode/rapports/widget/title_widget.dart';
import 'package:flutter/material.dart';

class PdfPage extends StatefulWidget {
  @override
  _PdfPageState createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  @override
  void initState() {
    super.initState();
    // getVaccins();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            MyApp.title,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(32),
            child: Column(
              children: [
                TitleWidget(
                  icon: Icons.picture_as_pdf,
                  text: 'Documents',
                ),
                Center(
                  child: Container(
                    width: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(height: 48),
                        ButtonWidget(
                          text: 'Liste étangs',
                          onClicked: () async {
                            _showDialogEtangs(context);
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ButtonWidget(
                          text: 'Liste cages',
                          onClicked: () async {
                            _showDialogCages(context);
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ButtonWidget(
                          text: 'Liste identificateurs',
                          onClicked: () {
                            setState(() async {
                              await _showDialogIdentif(context);
                            });
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ButtonWidget(
                          text: 'Liste producteurs aliments',
                          onClicked: () {
                            setState(() async {
                              await _showDialogProdAlm(context);
                            });
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ButtonWidget(
                          text: 'Liste producteurs alevins',
                          onClicked: () {
                            setState(() async {
                              await _showDialogProdAlv(context);
                            });
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ButtonWidget(
                          text: 'Liste des transformateurs',
                          onClicked: () {
                            setState(() async {
                              await _showDialogProdTrans(context);
                            });
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ButtonWidget(
                          text: 'Liste des vendeurs',
                          onClicked: () {
                            setState(() async {
                              await _showDialogVend(context);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  _showDialogEtangs(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            backgroundColor: Colors.cyan.shade100,
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Container(
                  width: 200,
                  // child: RapportEnfantMois(),
                ),
              ),
            ),
          );
        });
  }

  _showDialogCages(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            backgroundColor: Colors.cyan.shade100,
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Container(
                  width: 200,
                  // child: RapportEnfantMois(),
                ),
              ),
            ),
          );
        });
  }

  _showDialogIdentif(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            backgroundColor: Colors.cyan.shade100,
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Container(
                  width: 200,
                  child: RapportIdentif(),
                ),
              ),
            ),
          );
        });
  }

  _showDialogProdAlm(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            backgroundColor: Colors.cyan.shade100,
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Container(
                  width: 200,
                  child: RapportProdAlm(),
                ),
              ),
            ),
          );
        });
  }

  _showDialogProdAlv(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            backgroundColor: Colors.cyan.shade100,
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Container(
                  width: 200,
                  child: RapportProdAlv(),
                ),
              ),
            ),
          );
        });
  }

  _showDialogProdTrans(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            backgroundColor: Colors.cyan.shade100,
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Container(
                  width: 200,
                  child: RapportTransformateur(),
                ),
              ),
            ),
          );
        });
  }

  _showDialogVend(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            backgroundColor: Colors.cyan.shade100,
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Container(
                  width: 200,
                  child: RapportVendeur(),
                ),
              ),
            ),
          );
        });
  }
}
