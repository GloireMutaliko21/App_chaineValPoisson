import 'dart:io';

import 'package:amidacode/models/usersModel/data_source.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:universal_html/html.dart' as html;

class RapportProdAlm extends StatefulWidget {
  @override
  _RapportProdAlmState createState() => _RapportProdAlmState();
}

class _RapportProdAlmState extends State<RapportProdAlm> {
  List list = <dynamic>[];

  Future<void> getEnfant() async {
    await DataSource.getInstance.getCurrentData(
        params: {"event": "FIND_PRODUCTEURS_ALIMENT"}).then((data) {
      if (mounted)
        setState(() {
          list = data;
        });
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  void initState() {
    super.initState();
    getEnfant();
  }

  @override
  Widget build(BuildContext context) {
    final headers = [
      'ID',
      'NOM ET POST-NOM',
      'AGE',
      'CONTACT',
      'ADRESSE',
      'SEXE',
    ];
    final data = list.map((item) {
      return [
        '${item['idProducteur']}',
        '${item['nomProducteur']} - ${item['postnomProducteur']}',
        '${item['ageProducteur']}',
        '${item['telephoneProducteur']}',
        '${item['adresseProducteur']}',
        '${item['sexeProducteur']}',
      ];
    }).toList();
    final pdf = pw.Document();
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
              child: pw.Column(children: <pw.Widget>[
            pw.Text("LISTE DES PRODUCTEURS D'ALEVINS",
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 10),
            pw.Container(color: PdfColors.black, height: 1),
            pw.SizedBox(height: 30),
            pw.Table.fromTextArray(
              data: data,
              headers: headers,
              border: pw.TableBorder.all(),
              headerStyle:
                  pw.TextStyle(fontWeight: pw.FontWeight.normal, fontSize: 10),
              headerDecoration: pw.BoxDecoration(color: PdfColors.grey300),
              cellHeight: 30,
              cellAlignments: {
                0: pw.Alignment.centerLeft,
                1: pw.Alignment.centerLeft,
                2: pw.Alignment.centerLeft,
                3: pw.Alignment.centerLeft,
                4: pw.Alignment.centerLeft,
                5: pw.Alignment.centerLeft,
              },
            )
          ])
              // child: pw.Text('Hello World'),
              );
        }));

    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                setState(() async {
                  final bytes = await pdf.save();
                  final dir = await getApplicationDocumentsDirectory();
                  final file = File('${dir.path}/prod_aliment.pdf');

                  await file.writeAsBytes(bytes);
                  final url = file.path;

                  await OpenFile.open(url);
                });
              },
              child: Text('Ouvrir'),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () async {
                final bytes = await pdf.save();
                final dir = await getApplicationDocumentsDirectory();
                final file = File('${dir.path}/prod_aliment.pdf');

                await file.writeAsBytes(bytes);
                final url = file.path;
                await OpenFile.open(url);
              },
              child: Text('Télécharger'),
            ),
          ],
        ),
      ),
    );
  }
}
