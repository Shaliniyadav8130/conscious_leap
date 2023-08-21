import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// Zoho schedule session service

class SchedulingSessionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse('https://colecowellbeingopcpvtltd.zohobookings.in/portal-embed#/customer/colecowellbeingopcpvtltd')),
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            // You can customize options here if needed
          ),
        ),
      ),
    );
  }
}



