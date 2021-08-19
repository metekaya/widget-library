import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:widget_testing/consts/custom_colors.dart';

class WaveBackgroundScreen extends StatelessWidget {
  static const routeName = '/WaveBackgroundScreen';

  const WaveBackgroundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.95,
                child: RotatedBox(
                  quarterTurns: 2,
                  child: WaveWidget(
                    config: CustomConfig(
                      gradients: [
                        [
                          Colors.lime,
                          Colors.amber,
                          Colors.purple,
                        ],
                        [
                          CustomColors.secondaryColor,
                          CustomColors.primaryColor,
                        ]
                      ],
                      durations: [25000, 10800],
                      heightPercentages: [0.19, 0.20],
                      blur: MaskFilter.blur(BlurStyle.solid, 20),
                      gradientBegin: Alignment.bottomLeft,
                      gradientEnd: Alignment.topRight,
                    ),
                    waveAmplitude: 0,
                    size: Size(
                      double.infinity,
                      double.infinity,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(2),
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: CustomColors.primaryColor,
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        iconSize: 25,
                        icon: Icon(Icons.arrow_back),
                        color: CustomColors.secondaryColor,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        'Widget Kütüphanesi',
                        style: TextStyle(
                            fontFamily: 'HandWrite',
                            fontSize: 30,
                            color: CustomColors.secondaryColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
