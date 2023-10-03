


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app/shared/constands/colors.dart';



class GradientButton extends StatelessWidget {
  final String text;
  final Widget? child;
  final Gradient? gradient;
  final double width;
  final double height;
  final Function? onPressed;

  const GradientButton({
    Key? key,
    this.text = "",
    this.child,
    this.gradient,
    this.width = double.infinity,
    this.height = 50.0,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height:height,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: <Color>[
                //0xff00c2ef
                Color(0xff00C0ED),
                Color(0xff00ACD4),
                Color(0xff0092B3),
              ],
            ),
        borderRadius: BorderRadius.circular(22.0),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(borderRadius: BorderRadius.circular(22.0),
          splashColor: Colors.red,
          onTap: onPressed as void Function()?,
          child: Center(
            child: text != ""
                ? Text(
              text,
              style: GoogleFonts.montserrat(
                color: ColorConstants.APPPRIMARYWHITECOLOR,
                fontSize: 16,
              ),
            )
                : child,
          ),
        ),
      ),
    );
  }
}
