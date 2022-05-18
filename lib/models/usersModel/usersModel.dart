class UserModel {
  String idAdmin;
  String login;
  String nom;

  UserModel({this.idAdmin, this.login, this.nom});

  factory UserModel.fromJson(Map<String, dynamic> i) =>
      UserModel(idAdmin: i['idAdmin'], login: i['login'], nom: i['nom']);
  Map<String, dynamic> toMap() =>
      {"idAdmin": idAdmin, "login": login, "nom": nom};
}
