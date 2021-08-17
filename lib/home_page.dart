import 'package:flutter/material.dart';
import 'package:widget_testing/consts/custom_colors.dart';
import 'package:widget_testing/widgets/chart.dart';
import 'package:widget_testing/widgets/wave_background.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: deviceHeight * 0.95,
            width: double.infinity,
            color: CustomColors.primaryColor,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: 45, right: 8, left: 8, bottom: 70),
                  child: Text(
                    'Widget Kütüphanesi',
                    style: TextStyle(
                      color: CustomColors.secondaryColor,
                      fontSize: 45,
                      fontFamily: 'HandWrite',
                    ),
                  ),
                ),
                HomePageButton(
                  'Chart Widget',
                  () {
                    navigateTo(context, ChartPage.routeName);
                  },
                ),
                HomePageButton(
                  'Wave Background',
                  () {
                    navigateTo(context, WaveBackground.routeName);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navigateTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  Widget HomePageButton(String title, Function() fct) {
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 1),
            blurRadius: 2.0,
          )
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Material(
        color: CustomColors.secondaryColor,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: fct,
          splashColor: CustomColors.lightPrimary,
          child: Container(
            alignment: Alignment.center,
            height: 50,
            width: 200,
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: CustomColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
