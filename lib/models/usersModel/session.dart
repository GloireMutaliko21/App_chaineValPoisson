import 'package:shared_preferences/shared_preferences.dart';

class MyPreferences {
  static MyPreferences _myPreferences = new MyPreferences();

  static String idAdmin = "";
  static String idIdentificateur = "";
  static String nom = "";
  static String login = "";
  static String mdp = "";
  static String adresse = "";
  static String age = "";
  static String telephone = "";

  static MyPreferences get getInit {
    return _myPreferences == null
        ? _myPreferences = MyPreferences()
        : _myPreferences;
  }

  Future<bool> setPresistence(var data) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // preferences.setString("idAdmin", data[0]['idAdmin']);
    preferences.setString("idIdentificateur", data[0]['idIdentificateur']);
    preferences.setString("nom_complet", data[0]['nom_complet']);
    preferences.setString("login", data[0]['login']);
    preferences.setString("mdp", data[0]['mdp']);
    preferences.setString("adresse", data[0]['adresse']);
    preferences.setString("age", data[0]['age']);
    preferences.setString("telephone", data[0]['telephone']);
    return preferences.setString(
        "idIdentificateur", data[0]['idIdentificateur']);
  }

  Future<void> getPresistence() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // idAdmin = preferences.getString("idAdmin");
    idIdentificateur = preferences.getString("idIdentificateur");
    nom = preferences.getString("nom_complet");
    login = preferences.getString("login");
    mdp = preferences.getString("mdp");
    adresse = preferences.getString("adresse");
    age = preferences.getString("age");
    telephone = preferences.getString("telephone");
  }
}
