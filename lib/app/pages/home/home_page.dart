import 'package:app_covid_flutter/app/pages/home/components/card_component.dart';
import 'package:app_covid_flutter/app/pages/home/components/global_component.dart';
import 'package:app_covid_flutter/app/pages/home/home_controller.dart';
import 'package:app_covid_flutter/app/shared/repository/covid_repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller =
      HomeController(covidRepository: CovidRepository());

  @override
  void initState() {
    super.initState();
    controller.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dados Mundiais Covid'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              controller.loadData();
            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              builder: (_, __) {
                return ValueListenableBuilder(
                  builder: (_, __, ___) {
                    if (controller.isLoading.value) {
                      return Container(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [CircularProgressIndicator()],
                        ),
                      );
                    }
                    return ValueListenableBuilder(
                      builder: (_, __, ___) {
                        return Column(
                          children: [
                            GlobalComponent(
                                global:
                                    controller.covidWrapper.value.global!),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: TextField(
                                  onChanged: controller.setQuery,
                                  textInputAction: TextInputAction.go,
                                  decoration: InputDecoration(
                                    border: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.teal),
                                    ),
                                    hintText: 'Search Country',
                                  ),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: controller
                                    .covidWrapper.value.countries.length,
                                itemBuilder: (context, index) => Container(
                                  child: CardComponent(
                                    countries: controller
                                        .covidWrapper.value.countries[index],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      valueListenable: controller.covidWrapper,
                    );
                  },
                  valueListenable: controller.isLoading,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
