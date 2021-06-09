import 'dart:convert';

import 'package:app_covid_flutter/app/shared/model/countries.dart';
import 'package:app_covid_flutter/app/shared/model/global.dart';

class CovidWrapper {
  String id;
  String message;
  Global global;
  List<Countries> countries;
  String date;

  CovidWrapper({
    required this.id,
    required this.message,
    required this.global,
    required this.countries,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'ID': id,
      'Message': message,
      'Global': global.toMap(),
      'Countries': countries.map((x) => x.toMap()).toList(),
      'Date': date,
    };
  }

  factory CovidWrapper.fromMap(Map<String, dynamic> map) {
    return CovidWrapper(
      id: map['ID'],
      message: map['Message'],
      global: Global.fromMap(map['Global']),
      countries: List<Countries>.from(map['Countries'].map((x) => Countries.fromMap(x))),
      date: map['Date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CovidWrapper.fromJson(String source) => CovidWrapper.fromMap(json.decode(source));

}
