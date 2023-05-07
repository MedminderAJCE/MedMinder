import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class clockview extends StatefulWidget {
  const clockview({Key? key}) : super(key: key);

  @override
  State<clockview> createState() => _clockviewState();
}

class _clockviewState extends State<clockview> {
  @override void initState(){
    Timer.periodic(Duration(seconds : 1), (timer) {
      setState(() {

      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      child: Transform.rotate(
        angle: -pi/2,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter
{
  var dateTime = DateTime.now();
  @override
  void paint(Canvas canvas, Size size) {
    var centreX = size.width/2;
    var centerY = size.height/2;
    var center = Offset(centreX,centerY);
    var radius = min(centreX,centerY);
    var outerRadius = radius-20;
    var innerRadius = radius-30;
    Paint hourDashPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 4
      ..strokeCap =StrokeCap.round;

    for(int i=0; i<360; i+=30){
      var x1 = centreX - outerRadius * cos(i*pi/180);
      var y1 = centreX - outerRadius * sin(i*pi/180);

      var x2 = centreX - innerRadius * cos(i*pi/180);
      var y2 = centreX - innerRadius * sin(i*pi/180);

      canvas.drawLine(Offset(x1,y1),Offset(x2, y2),hourDashPaint);
    }

    var fillBrush = Paint()
      ..color = Color(0xFF44974);

    var outlineBrush = Paint()
      ..color =Color(0xFFEAECFF)
      ..style =PaintingStyle.stroke
      ..strokeWidth=16;

    var centerfillBrush = Paint()
      ..color=Color(0xFFEAECFF);

    var secHandBrush =Paint()
      ..color = Colors.orange
      ..style =PaintingStyle.stroke
      ..strokeCap=StrokeCap.round
      ..strokeWidth=8;

    var minHandBrush =Paint()
      ..shader= RadialGradient(colors:[Colors.lightBlue,Colors.pink])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style =PaintingStyle.stroke
      ..strokeCap=StrokeCap.round
      ..strokeWidth=10;

    var hourHandBrush =Paint()
      ..shader= RadialGradient(colors:[Colors.lightBlue,Colors.pink])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style =PaintingStyle.stroke
      ..strokeCap=StrokeCap.round
      ..strokeWidth=10;


    canvas.drawCircle(center, radius-40, fillBrush);
    canvas.drawCircle(center, radius-40, outlineBrush);

    var hourHandX = centreX + 60 * cos((dateTime.hour*30 + dateTime.minute*0.5) * pi/180);
    var hourHandY = centreX + 60 * sin((dateTime.hour*30 + dateTime.minute*0.5) * pi/180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    var minHandX = centreX + 80 * cos(dateTime.minute * 6 * pi/180);
    var minHandY = centreX + 80 * sin(dateTime.minute * 6 * pi/180);
    canvas.drawLine(center, Offset(minHandX,minHandY), minHandBrush);

    var secHandX = centreX + 80 * cos(dateTime.second * 6 * pi/180);
    var secHandY = centreX + 80 * sin(dateTime.second * 6 * pi/180);
    canvas.drawLine(center, Offset(secHandX,secHandY), secHandBrush);

    canvas.drawCircle(center, 16, centerfillBrush);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

