import 'package:amidacode/models/constantes_class.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class DataInsert {
  static DataInsert _instance = DataInsert();

  static DataInsert get getInstance {
    return _instance == null ? _instance = DataInsert() : _instance;
  }

//==============================================================================
//==============================================================================
//++++++++++++++++++++++ METHODE DE CONNEXION AU SYSTEME++++++++++++++++++++++++++++++

  Future<String> addIndentif({var data}) async {
    try {
      final response = await http.post(Uri.parse("${URL}AjoutIdentif.php"),
          body: jsonEncode(data));
      if (response.statusCode == 200) {
        var resultat = await jsonDecode(response.body);
        resultat.forEach((data) => {print(data)});

        AlertDialog(
          scrollable: true,
          title: Text(
            "Enregistré",
            textAlign: TextAlign.center,
          ),
        );
      } else {}
    } catch (_) {
      print("=======================${_.toString()}");
    }
    return null;
  }
//==============================================================================
//==============================================================================
//++++++++++++++++++++++ INSCRIRE UN PRODUCTEUR ++++++++++++++++++++++++++++++

  Future<String> addProducer({var data}) async {
    try {
      final response = await http.post(Uri.parse("${URL}AjoutProducer.php"),
          body: jsonEncode(data));
      if (response.statusCode == 200) {
        var resultat = await jsonDecode(response.body);
        resultat.forEach((data) => {print(data)});

        AlertDialog(
          scrollable: true,
          title: Text(
            "Enregistré",
            textAlign: TextAlign.center,
          ),
        );
      } else {}
    } catch (_) {
      print("=======================${_.toString()}");
    }
    return null;
  }
//==============================================================================
//==============================================================================
//++++++++++++++++++++++ INSCRIRE UN TRANSFORMATEUR ++++++++++++++++++++++++++++++

  Future<String> addTransform({var data}) async {
    try {
      final response = await http.post(Uri.parse("${URL}AjoutTransform.php"),
          body: jsonEncode(data));
      if (response.statusCode == 200) {
        var resultat = await jsonDecode(response.body);
        resultat.forEach((data) => {print(data)});

        AlertDialog(
          scrollable: true,
          title: Text(
            "Enregistré",
            textAlign: TextAlign.center,
          ),
        );
      } else {}
    } catch (_) {
      print("=======================${_.toString()}");
    }
    return null;
  }
//==============================================================================
//==============================================================================
//++++++++++++++++++++++ INSCRIRE UN VENDEUR ++++++++++++++++++++++++++++++

  Future<String> addSeller({var data}) async {
    try {
      final response = await http.post(Uri.parse("${URL}AjoutVendeur.php"),
          body: jsonEncode(data));
      if (response.statusCode == 200) {
        var resultat = await jsonDecode(response.body);
        resultat.forEach((data) => {print(data)});

        AlertDialog(
          scrollable: true,
          title: Text(
            "Enregistré",
            textAlign: TextAlign.center,
          ),
        );
      } else {}
    } catch (_) {
      print("=======================${_.toString()}");
    }
    return null;
  }
//==============================================================================
//==============================================================================
//++++++++++++++++++++++ AJOUTER ETANG ++++++++++++++++++++++++++++++

  Future<String> addEtang({var data}) async {
    try {
      final response = await http.post(Uri.parse("${URL}AjoutEtang.php"),
          body: jsonEncode(data));
      if (response.statusCode == 200) {
        var resultat = await jsonDecode(response.body);
        resultat.forEach((data) => {print(data)});
      } else {}
    } catch (_) {
      print("=======================${_.toString()}");
    }
    return null;
  }
//==============================================================================
//==============================================================================
//++++++++++++++++++++++ AJOUTER ETANG ++++++++++++++++++++++++++++++

  Future<String> addCage({var data}) async {
    try {
      final response = await http.post(Uri.parse("${URL}AjoutCage.php"),
          body: jsonEncode(data));
      if (response.statusCode == 200) {
        var resultat = await jsonDecode(response.body);
        resultat.forEach((data) => {print(data)});
      } else {}
    } catch (_) {
      print("=======================${_.toString()}");
    }
    return null;
  }
}
