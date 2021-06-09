import 'package:app_covid_flutter/app/pages/details/details_page.dart';
import 'package:app_covid_flutter/app/shared/model/countries.dart';
import 'package:app_covid_flutter/app/shared/utils/utils.dart';
import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  final Countries countries;

  const CardComponent(
      {Key? key,
        required this.countries,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Card(
          elevation: 5,
          color: Colors.grey.shade200,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push<Countries>(
                MaterialPageRoute(builder: (context) {
                  return Details(country: countries);
                }),
              );
            },
            child: Container(
              padding: EdgeInsets.only(
                left: 20,
                top: 20,
                right: 5,
                bottom: 20,
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Text(
                      '${countries.country} - ${countries.countryCode} ',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        Utils.formattedDateAndHours(countries.date),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
