import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:widget_testing/consts/custom_colors.dart';
import 'package:widget_testing/widgets/custom_appbar.dart';

const _urlGit = 'https://github.com/metekaya';
const _urlLinkedIn = 'https://www.linkedin.com/in/mete-kaya-2a57b31a7/';
const _urlTwitter = 'https://twitter.com/metekkaya';

class UrlLaunchersScreen extends StatefulWidget {
  static const routeName = '/UrlLauncherScreen';

  const UrlLaunchersScreen({Key? key}) : super(key: key);

  @override
  _UrlLaunchersScreenState createState() => _UrlLaunchersScreenState();
}

class _UrlLaunchersScreenState extends State<UrlLaunchersScreen> {
  void _launchGithub() async => await canLaunch(_urlGit)
      ? await launch(_urlGit)
      : throw 'Could not launch $_urlGit';

  void _launchLinkedIn() async => await canLaunch(_urlLinkedIn)
      ? await launch(_urlLinkedIn)
      : throw 'Could not launch $_urlLinkedIn';

  void _launchTwitter() async => await canLaunch(_urlTwitter)
      ? await launch(_urlTwitter)
      : throw 'Could not launch $_urlTwitter';

  _launchMail() async {
    final url = Uri.encodeFull(
        'mailto:metekaya55@gmail.com?subject=News&body=New plugin');
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void getDcUsername() {
    Clipboard.setData(
      ClipboardData(text: "Mete Kaya#9601"),
    );
    Fluttertoast.showToast(
      msg: "Kullanıcı adı panoya kopyalandı!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey.shade800,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.lightSecondary,
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  'URL Butonları',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.primaryColor),
                ),
                Divider(
                  thickness: 2,
                  color: CustomColors.primaryColor,
                ),
                urlButtonFirstRow(),
                urlButtonSecondRow(),
                textArea(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textArea() {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(15),
      width: double.infinity,
      height: 430,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: CustomColors.secondaryColor),
      child: Column(
        children: [
          Text(
              'Yukarıdaki butonlar "url_launcher" isimli kütüphaneden faydalanılarak, oluşturulan '
              'butonlardır.',
              style: TextStyle(fontSize: 18, color: CustomColors.primaryColor)),
          SizedBox(
            height: 10,
          ),
          Text(
            'Butonlara tıklandığında ilgili sayfalara ve eğer ilgili uygulama yüklü ise uygulamaya '
            'yönlendirmektedir. Gmail butonunda mail yollamaya yönlendirmekte ve Discord butonuna bastığımızda ise '
            'Discord kullanıcı ismini panoya kopyalamaktadır.',
            style: TextStyle(fontSize: 18, color: CustomColors.primaryColor),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Gmail butonunda mail yollamaya yönlendirmekte ve Discord butonuna bastığımızda ise '
            'Discord kullanıcı ismini panoya kopyalamaktadır.',
            style: TextStyle(fontSize: 18, color: CustomColors.primaryColor),
          )
        ],
      ),
    );
  }

  Widget urlButtonSecondRow() {
    return Container(
      width: double.infinity,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          urlButton(
            'Twitter',
            Ionicons.logo_twitter,
            Colors.blue.shade600,
            Colors.blue.shade300,
            _launchTwitter,
          ),
          urlButton(
            'Gmail',
            Ionicons.logo_google,
            Colors.red,
            Colors.red.shade200,
            _launchMail,
          ),
          urlButton(
            'Discord',
            Ionicons.logo_discord,
            Colors.grey.shade800,
            Colors.grey.shade400,
            getDcUsername,
          ),
        ],
      ),
    );
  }

  Widget urlButtonFirstRow() {
    return Container(
      width: double.infinity,
      height: 100,
      child: Row(
        children: [
          urlButton(
            'Github',
            Ionicons.logo_github,
            Colors.black,
            Colors.grey.shade400,
            _launchGithub,
          ),
          urlButton(
            'LinkedIn',
            Ionicons.logo_linkedin,
            Colors.blue,
            Colors.blue.shade200,
            _launchLinkedIn,
          ),
          urlButton(
            'Facebook',
            Ionicons.logo_facebook,
            Colors.blue.shade800,
            Colors.blue.shade400,
            _launchGithub,
          ),
        ],
      ),
    );
  }

  Widget urlButton(String title, IconData icon, Color color, Color highlight,
      Function() fct) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: OutlineButton(
        onPressed: fct,
        shape: StadiumBorder(),
        highlightedBorderColor: highlight,
        borderSide: BorderSide(
          width: 1,
          color: color,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 16,
              color: color,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
