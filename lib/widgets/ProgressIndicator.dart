import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Circular Percent Indicator'),
        ),
        body: Center(
          child: CircularPercentIndicator(
            radius: 150.0,
            lineWidth: 10.0,
            percent: 0.6, // 60%
            center: Text(
              '60%',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            progressColor: Colors.blue,
          ),
        ),
      ),
    );
  }
}

class CircularPercentIndicator extends StatelessWidget {
  final double radius;
  final double lineWidth;
  final double percent;
  final Widget center;
  final Color progressColor;

  CircularPercentIndicator({
    required this.radius,
    required this.lineWidth,
    required this.percent,
    required this.center,
    required this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      child: Stack(
        children: [
          CircularProgressIndicator(
            strokeWidth: lineWidth,
            value: percent,
            valueColor: AlwaysStoppedAnimation<Color>(progressColor),
          ),
          Center(child: center),
        ],
      ),
    );
  }
}
