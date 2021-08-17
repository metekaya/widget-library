import 'package:flutter/material.dart';
import 'package:widget_testing/widgets/chart.dart';
import 'package:widget_testing/home_page.dart';
import 'package:widget_testing/widgets/wave_background.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: SafeArea(
          child: Scaffold(
            body: HomePage(),
          ),
        ),
        theme: ThemeData(fontFamily: 'Quicksand'),
        routes: {
          ChartPage.routeName: (ctx) => ChartPage(),
          WaveBackground.routeName: (ctx) => WaveBackground(),
        });
  }
}
