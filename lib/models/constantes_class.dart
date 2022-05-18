import 'package:flutter/material.dart';

const URL = "https://iitaapp.000webhostapp.com/IITAapp/";

class Constantes {
  static List listIdentif = <String>[];
  static List listMereEnfant = <String>[];
  static List listMere = <String>[];
}

Widget cbList(
        {List<DropdownMenuItem<String>> list,
        title,
        var valeur,
        var onChanged}) =>
    Container(
      width: 300,
      child: DropdownButtonFormField(
        isExpanded: true,
        menuMaxHeight: 100,
        items: list,
        value: valeur,
        onChanged: onChanged,
        hint: Text(
          "${title}",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
        ),
        decoration: InputDecoration(
          //labelText: "Technologies",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(29)),
          fillColor: Colors.white, filled: true,
          hintStyle: TextStyle(
              fontSize: 13,
              color: Colors.black,
              fontWeight: FontWeight.w500,
              backgroundColor: Colors.white),
          contentPadding: EdgeInsets.fromLTRB(40, 10, 50, 1),
          //border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
        validator: (val) => val == null ? "Ce champs est obligatoire" : null,
        onSaved: (val) => valeur = val,
      ),
    );

List<DropdownMenuItem<String>> isList({List<String> value}) {
  return value
      .map(
        (value) => DropdownMenuItem(
          value: value,
          child: value == null || value.isEmpty
              ? Text("")
              : Row(
                  children: [
                    Container(
                      height: 16,
                      width: 16,
                      child: Center(
                        child: Text(
                          value.substring(0, 1).toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    SizedBox(width: 3),
                    Text(
                      value,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
        ),
      )
      .toList();
}
