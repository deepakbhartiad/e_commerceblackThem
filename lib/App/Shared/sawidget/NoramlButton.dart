//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bounce/flutter_bounce.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mocklee/App/Shared/constands/colors.dart';
//
//
// class GradientButton extends StatelessWidget {
//   final String text;
//   final Widget? child;
//   final Gradient? gradient;
//   final double width;
//   final double height;
//   final Function() onPressed;
//
//   const GradientButton({
//     Key? key,
//     this.text = "",
//     this.child,
//     this.gradient,
//     this.width = double.infinity,
//     this.height = 50.0,
//     required this.onPressed,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       height: height,
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.topRight,
//               colors: <Color>[
//                 //0xff00c2ef
//                 Color(0xff00C0ED),
//                 Color(0xff00ACD4),
//                 Color(0xff0092B3),
//               ],
//             ),
//         borderRadius: BorderRadius.circular(22.0),
//       ),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           splashColor: Colors.red,
//           child: Center(
//             child: text != ""
//                 ? Text(
//               text,
//               style:  GoogleFonts.montserrat(
//                 color: ColorConstants.appPrimaryWhiteColor,
//                 fontSize: 16,
//               ),
//             )
//                 : child,
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app/shared/constands/colors.dart';


class NormalButton extends StatelessWidget {
  final String text;
  final Widget? child;
  final double width;
  final double height;
  final Function? onPressed;
   Color? borderColor;
  Color? textColor=ColorConstants.APPPRIMARYBLACKCOLOR;

   NormalButton({
    Key? key,
    this.text = "",
    this.child,
    this.width = double.infinity,
    this.height = 50.0,
    this.onPressed,
    this.textColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height:height,
      decoration: BoxDecoration(
        color: const Color(0xffD9D9D9),
        borderRadius: BorderRadius.circular(26.0),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(borderRadius: BorderRadius.circular(26.0),
          splashColor: Colors.black26,
          onTap: onPressed as void Function()?,
          child: Center(
            child: text != ""
                ? Text(
              text,
              style: GoogleFonts.inter(
                color: Color(0xff434343),
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
