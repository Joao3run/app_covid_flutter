import 'package:app_covid_flutter/app/shared/model/countries.dart';
import 'package:app_covid_flutter/app/shared/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CovidCountryInformation extends StatelessWidget {
  final Countries country;

  CovidCountryInformation({required this.country});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      '${country.country} - ${country.countryCode} ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      Utils.formattedDateAndHours(country.date),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            _info('assets/angry.png', 'Total confirmados: ',
                country.newConfirmed.toString()),
            _info('assets/happy.png', 'Total recuperados: ',
                country.newRecovered.toString()),
            _info('assets/sad.png', 'Total mortes: ',
                country.newDeaths.toString()),
          ],
        ),
      ),
    );
  }

  _info(String imgPath, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Image.asset(
            imgPath,
            height: 30,
            width: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            value,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
