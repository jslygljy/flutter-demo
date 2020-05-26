import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:url_launcher/url_launcher.dart';
class AdDemo extends StatelessWidget {
  final String adpicture;
  final String phoneNumber;
  const AdDemo({Key key, this.adpicture, this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){print('拨打电话');},
      child:  Image.network(adpicture,
        width: ScreenUtil().setWidth(750),
        height: ScreenUtil().setHeight(200),
        fit: BoxFit.fill,
      )
    );
  }
  // _launchURL() async {
  //   const url = 'https://flutter.dev';
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

}