import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:widget_testing/consts/custom_colors.dart';
import 'package:widget_testing/widgets/custom_appbar.dart';

class ChartScreen extends StatefulWidget {
  static const routeName = '/ChartScreen';

  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  List<_PieData>? pieData;
  TooltipBehavior? _tooltipBehavior;
  var name;
  var number;

  final nameCont = new TextEditingController();
  final numberCont = new TextEditingController();

  @override
  void initState() {
    pieData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.lightSecondary,
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.50,
                width: double.infinity,
                child: Center(
                    child: SfCircularChart(
                        title: ChartTitle(
                          text: 'Veri Seviyesi',
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Quicksand',
                          ),
                        ),
                        legend: Legend(isVisible: true),
                        tooltipBehavior: _tooltipBehavior,
                        series: <PieSeries<_PieData, String>>[
                      PieSeries<_PieData, String>(
                          explode: true,
                          explodeIndex: 0,
                          dataSource: pieData,
                          xValueMapper: (_PieData data, _) => data.xData,
                          yValueMapper: (_PieData data, _) => data.yData,
                          dataLabelMapper: (_PieData data, _) => data.text,
                          dataLabelSettings:
                              DataLabelSettings(isVisible: true)),
                    ])),
              ),
              Divider(
                thickness: 2,
                color: CustomColors.primaryColor,
              ),
              Material(
                color: Colors.white,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.50,
                  width: double.infinity,
                  color: CustomColors.lightSecondary,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ChartTextField('Veri Başlığı', Icons.title),
                      ChartTextField('Veri Sayısı', Icons.data_saver_off),
                      Material(
                        borderRadius: BorderRadius.circular(20),
                        color: CustomColors.primaryColor,
                        child: IconButton(
                            color: CustomColors.secondaryColor,
                            onPressed: () {
                              name = nameCont.text;
                              number = int.parse(numberCont.text);
                              log(name);
                              log(number);
                            },
                            icon: Icon(Icons.add)),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget ChartTextField(String hintText, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        controller: nameCont,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            size: 25,
          ),
          hintText: hintText,
          labelText: 'Veri',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }

  List<_PieData> getChartData() {
    final List<_PieData> pieData = [
      _PieData('Mete', 2000),
      _PieData('Merve', 3000),
      _PieData('Ömür', 5000),
      _PieData('Atlas', 5000),
    ];
    return pieData;
  }

  void getUserInput() {
    setState(() {
      _PieData(name, number);
    });
  }
}

class _PieData {
  _PieData(this.xData, this.yData, [this.text]);
  final String xData;
  final num yData;
  final String? text;
}
