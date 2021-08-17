import 'package:flutter/material.dart';
import 'package:widget_testing/consts/custom_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2),
      child: AppBar(
        backgroundColor: CustomColors.primaryColor,
        centerTitle: true,
        title: Text(
          'Widget Kütüphanesi',
          style: TextStyle(fontFamily: 'HandWrite', fontSize: 30),
        ),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
            top: Radius.circular(30),
          ),
        ),
      ),
    );
  }
}
