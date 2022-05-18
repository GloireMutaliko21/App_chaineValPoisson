import 'package:amidacode/models/constantes_class.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataUpdate {
  static DataUpdate _instance = DataUpdate();

  static DataUpdate get getInstance {
    return _instance == null ? _instance = DataUpdate() : _instance;
  }

//==============================================================================
//==============================================================================
//++++++++++++++++++++++ UPDATE IDENTIFICATEUR ++++++++++++++++++++++++++++++

  Future<String> updateIndentif({var data}) async {
    try {
      final response = await http.post(Uri.parse("${URL}ModifIdentif.php"),
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
//++++++++++++++++++++++ UPDATE TRANSFORMATEUR ++++++++++++++++++++++++++++++

  Future<String> updateTransf({var data}) async {
    try {
      final response = await http.post(Uri.parse("${URL}ModifTransf.php"),
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
//++++++++++++++++++++++ UPDATE VENDEUR ++++++++++++++++++++++++++++++

  Future<String> updateVend({var data}) async {
    try {
      final response = await http.post(Uri.parse("${URL}ModifVend.php"),
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
//++++++++++++++++++++++ UPDATE PRODUCTEUR ++++++++++++++++++++++++++++++

  Future<String> updateProduc({var data}) async {
    try {
      final response = await http.post(Uri.parse("${URL}ModifProduc.php"),
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
