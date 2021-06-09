import 'package:app_covid_flutter/app/pages/details/covid_country_information.dart';
import 'package:app_covid_flutter/app/shared/model/countries.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  Countries country;

  Details({required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: CovidCountryInformation(
          country: country,
        ),
      ),
    );
  }
}
