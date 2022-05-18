import 'dart:convert';

import 'package:amidacode/models/constantes_class.dart';
import 'package:http/http.dart' as http;

class DataSource {
  static DataSource _instance = DataSource();

  static DataSource get getInstance {
    return _instance == null ? _instance = DataSource() : _instance;
  }

  getData({Map<String, dynamic> params, donne}) async {
    List element = <String>[];
    final response = await http.post(
      Uri.parse("${URL}select.php"),
      body: params,
    );
    var resultat = await jsonDecode(response.body);
    for (int index = 0; index < resultat.length; index++) {
      element.add(resultat[index][donne]);
    }
    return element;
  }

  // getEnfant({ Map<dynamic, String> params}) async {
  //   final response =
  //       await http.post(Uri.parse("${URL}selectHop.php"), body: params);
  //   var resultat = await jsonDecode(response.body);
  //   Constantes.id = resultat['idEnfant'] ?? "0";
  //   Constantes.nom = resultat['noms'] ?? "";
  //   Constantes.sexe = resultat['sexe'] ?? "";
  //   return resultat ?? [];
  // }

  Future<List<dynamic>> getCurrentData({Map<dynamic, String> params}) async {
    //d'accord
    List<dynamic> data = <dynamic>[];
    final response =
        await http.post(Uri.parse("${URL}select.php"), body: params);
    var resultat = await jsonDecode(response.body);
    for (int i = 0; i < resultat.length; i++) {
      data.add(resultat[i]);
    }
    return data;
  }
}
