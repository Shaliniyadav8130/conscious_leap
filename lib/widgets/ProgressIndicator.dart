import 'dart:math' as math;
import 'package:flutter/material.dart';

class DynamicCircularProgressIndicator extends StatefulWidget {
  @override
  _DynamicCircularProgressIndicatorState createState() =>
      _DynamicCircularProgressIndicatorState();
}

class _DynamicCircularProgressIndicatorState
    extends State<DynamicCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 8), // Adjust the duration as needed
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });

    // Start the animation
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double percentage = _animation.value * 100;
    return Center(
      child: SizedBox(
        width: 40,
        height: 40,
        child: CustomPaint(
          painter: ProgressPainter(
            progress: _animation.value,
            gradient: _getLinearGradient(),
          ),
          child: Center(
            child: Text(
              '${percentage.toStringAsFixed(0)}%',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Function to define the gradient color for the progress indicator
  _getLinearGradient() {
    return LinearGradient(
      colors: [Colors.blue, Colors.green, Colors.yellow], // Add the desired gradient colors
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }
}

class ProgressPainter extends CustomPainter {
  final double progress;
  final Gradient gradient;

  ProgressPainter({required this.progress, required this.gradient});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = gradient.createShader(
        Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: size.width / 2,
        ),
      );

    double startAngle = -math.pi / 2;
    double sweepAngle = 2 * math.pi * progress;
    canvas.drawArc(
      Rect.fromLTWH(0, 0, size.width, size.height),
      startAngle,
      sweepAngle,
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Dynamic Circular Progress Indicator')),
      body: DynamicCircularProgressIndicator(),
    ),
  ));
}
