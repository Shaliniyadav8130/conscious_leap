import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class ScheduleSession extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
        //title: Text('Schedule Session'),
      //),
      body: Center(
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse('https://colecowellbeingopcpvtltd.zohobookings.in/portal-embed#/customer/sagrikaa'),
          ),
        ),
      ),
    );
  }
}
