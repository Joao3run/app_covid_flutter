import 'package:app_covid_flutter/app/shared/model/global.dart';
import 'package:app_covid_flutter/app/shared/utils/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class GlobalComponent extends StatelessWidget {
  final Global global;

  GlobalComponent({required this.global});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text.rich(
                  TextSpan(
                    text: 'Dados Globais: ',
                    style: TextStyle(
                      fontSize: 18,
                        fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: Utils.formattedDateAndHours(global.date),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            _info('assets/angry.png', 'Total confirmados: ',
                global.newConfirmed.toString()),
            _info('assets/happy.png', 'Total recuperados: ',
                global.newRecovered.toString()),
            _info('assets/sad.png', 'Total mortes: ',
                global.newDeaths.toString()),
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
