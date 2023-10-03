import 'package:flutter/material.dart';

class SAProgress extends StatelessWidget {
  final double width;
  final double height;
  final Color bgColor;
  final Color color;
  final int staticProgressValue;
  final dynamic progress;

  const SAProgress(
      {Key? key,
        required this.width,
        required this.height,
        this.color = Colors.white,
        this.progress = 0,
       required this.staticProgressValue,
        this.bgColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double pWidth = 0;
    if (progress == 0) {
      pWidth = 0;
    } else {
      pWidth = progress * staticProgressValue / progress;
    }

    return Row(
      children: [
        /*Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('${progress}'),
        ),*/

        Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(height / 2),
              ),
            ),
            Container(
              width: pWidth,
              height: height,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(height / 2),
              ),
            ),
          ],
        ),
      ],
    );
  }
}