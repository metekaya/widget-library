import 'package:flutter/material.dart';
import 'package:widget_testing/consts/custom_colors.dart';
import 'package:widget_testing/widgets/custom_appbar.dart';

class AnimatedFadeScreen extends StatefulWidget {
  static const routeName = '/AnimatedFadeScreen';
  const AnimatedFadeScreen({Key? key}) : super(key: key);

  @override
  _AnimatedFadeScreenState createState() => _AnimatedFadeScreenState();
}

class _AnimatedFadeScreenState extends State<AnimatedFadeScreen> {
  bool shouldAnimate = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedCrossFade(
              firstChild: firstChild(),
              secondChild: secondChild(),
              crossFadeState: shouldAnimate
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(
                milliseconds: 700,
              ),
            ),
            AnimatedCrossFade(
              firstChild: button(),
              secondChild: secondButton(),
              crossFadeState: shouldAnimate
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(
                milliseconds: 700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget firstChild() {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: 300,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: CustomColors.primaryColor,
        ),
        child: Text(
          'Animasyon Deneme',
          style: TextStyle(fontSize: 30, color: CustomColors.secondaryColor),
        ),
      ),
    );
  }

  void animate() {
    setState(() {
      shouldAnimate = true;
    });
  }

  void convert() {
    setState(() {
      shouldAnimate = false;
    });
  }

  Widget secondChild() {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: 500,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: CustomColors.secondaryColor,
        ),
        child: Text(
          'Çalıştı',
          style: TextStyle(fontSize: 30, color: CustomColors.primaryColor),
        ),
      ),
    );
  }

  Widget button() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      height: 30,
      width: 200,
      child: Material(
        color: CustomColors.secondaryColor,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          child: Text(
            'Başlat',
            textAlign: TextAlign.center,
            style: TextStyle(color: CustomColors.primaryColor, fontSize: 20),
          ),
          onTap: animate,
          onDoubleTap: convert,
        ),
      ),
    );
  }

  Widget secondButton() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      height: 30,
      width: 200,
      child: Material(
        color: CustomColors.primaryColor,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          child: Text(
            'Geri Al',
            textAlign: TextAlign.center,
            style: TextStyle(color: CustomColors.secondaryColor, fontSize: 20),
          ),
          onTap: convert,
        ),
      ),
    );
  }
}
