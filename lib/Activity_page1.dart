import 'package:consciousleap/Activity_page2.dart';
import 'package:consciousleap/Activity_page23.dart';
import 'package:consciousleap/Questionnarie/Activity_page4.dart';
import 'package:consciousleap/therapist/Therapist_List.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:consciousleap/widgets/Text_button.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// Select the option
// I want to talk to therapist
// I am a therapist

class Activity_page1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [

              GradientBorderButton(btnName: "I want to talk to a Therapist",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>Activity_page2()
                      ));
                },),

              SizedBox(height:5),
              GradientBorderButton(btnName: "I am a Therapist",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>Activity_page23()
                      ));
                },),

            ],
          )
        ],
      ),
    );
  }

}

class WebviewPage extends StatefulWidget {
  final String url;

  WebviewPage({required this.url});

  @override
  _WebviewPageState createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
            onLoadStop: (controller, url) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          if (isLoading)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
