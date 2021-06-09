import 'package:app_covid_flutter/app/shared/model/covid_wrapper.dart';

abstract class ICovidRepository {
  Future<CovidWrapper> loadData();
}
