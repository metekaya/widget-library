import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:widget_testing/consts/custom_colors.dart';
import 'package:widget_testing/widgets/custom_appbar.dart';

class SlidableWidgetScreen extends StatefulWidget {
  static const routeName = '/SlidableWidgetScreen';

  const SlidableWidgetScreen({Key? key}) : super(key: key);

  @override
  _SlidableWidgetScreenState createState() => _SlidableWidgetScreenState();
}

class _SlidableWidgetScreenState extends State<SlidableWidgetScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 5, left: 5, right: 5),
            child: Slidable(
              actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.25,
              child: Container(
                color: CustomColors.primaryColor,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: CustomColors.lightSecondary,
                    child: Text('M'),
                    foregroundColor: CustomColors.primaryColor,
                  ),
                  title: Text(
                    'Tile n° 10',
                    style: TextStyle(
                      color: CustomColors.secondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    'Kaydırmalı list item',
                    style: TextStyle(
                      color: CustomColors.secondaryColor,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              actions: <Widget>[
                IconSlideAction(
                  caption: 'Archive',
                  color: CustomColors.lightPrimary,
                  icon: Icons.archive,
                  onTap: () => _showSnackBar(context, 'Archive'),
                ),
                IconSlideAction(
                  foregroundColor: Colors.white,
                  caption: 'Share',
                  color: CustomColors.secondaryColor,
                  icon: Icons.share,
                  onTap: () => _showSnackBar(context, 'Share'),
                ),
              ],
              secondaryActions: <Widget>[
                IconSlideAction(
                  foregroundColor: Colors.white,
                  caption: 'More',
                  color: CustomColors.secondaryColor,
                  icon: Icons.more_horiz,
                  onTap: () => _showSnackBar(context, 'More'),
                ),
                IconSlideAction(
                  caption: 'Delete',
                  color: Colors.red,
                  icon: Icons.delete,
                  onTap: () => _showSnackBar(context, 'Delete'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(text)));
  }
}
