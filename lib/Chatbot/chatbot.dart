import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class ChatbotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chatbot"),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse("https://app.intelliticks.com/widgets/engage/Jpf3weRCe94WPCuMK_c?landing=https://consciousleap.co/&v=landing&engageType=playbook&engageName=64cb477e1b4ad92d82759d4a&isEmbedded=true"),
        ),
      ),
    );
  }
}
