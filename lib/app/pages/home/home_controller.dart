import 'package:app_covid_flutter/app/shared/model/countries.dart';
import 'package:app_covid_flutter/app/shared/model/covid_wrapper.dart';
import 'package:app_covid_flutter/app/shared/repository/covid_repository_interface.dart';
import 'package:flutter/widgets.dart';

class HomeController {
  final ICovidRepository covidRepository;
  ValueNotifier<bool> isLoading = ValueNotifier(false);

  HomeController({required this.covidRepository});

  late ValueNotifier<dynamic> covidWrapper = ValueNotifier(null);
  late ValueNotifier<List<Countries>> countries = ValueNotifier([]);
  late List<Countries> immutableCountries;

  showLoading() {
    isLoading.value = true;
    isLoading.notifyListeners();
  }

  hiddenLoading() {
    isLoading.value = false;
    isLoading.notifyListeners();
  }

  Future<void> loadData() async {
    showLoading();
    CovidWrapper covidWrapper = await covidRepository.loadData();
    changeCovidWrapper(covidWrapper);
    this.immutableCountries = covidWrapper.countries;
    hiddenLoading();
  }

  changeCovidWrapper(CovidWrapper wrapper) {
    this.covidWrapper.value = wrapper;
    this.covidWrapper.notifyListeners();
  }

  changeCountries(List<Countries> countries) {
  this.covidWrapper.value.countries = countries;
  this.covidWrapper.notifyListeners();
  }

  setQuery(String value) {
    if (value.isNotEmpty) {
      changeCountries(immutableCountries
          .where((item) =>
          item.country.toLowerCase().contains(value.toLowerCase()))
          .toList());
    } else {
    changeCountries(immutableCountries);
    }
  }


}
