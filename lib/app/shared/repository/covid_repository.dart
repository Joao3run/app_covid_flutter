import 'dart:convert';

import 'package:app_covid_flutter/app/shared/model/covid_wrapper.dart';
import 'package:app_covid_flutter/app/shared/repository/covid_repository_interface.dart';
import 'package:dio/dio.dart';

class CovidRepository implements ICovidRepository {
  @override
  Future<CovidWrapper> loadData() async {
    var response = await Dio().get('https://api.covid19api.com/summary');
    return CovidWrapper.fromMap(response.data);
  }
}
