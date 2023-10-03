


import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

Text headingText({required title,Color? color,double? fontSize,
  TextAlign? align,FontWeight? fontWeight,})=>
    Text(title,maxLines: 1,overflow: TextOverflow.ellipsis,style:
    GoogleFonts.openSans(fontSize: fontSize,color: color,
        fontWeight: fontWeight),textAlign: align);



Text headingFullText({required title,Color? color,double? fontSize,
  TextAlign? align,FontWeight? fontWeight,})=>
    Text(title,style: GoogleFonts.openSans(fontSize: fontSize,color: color,
        fontWeight: fontWeight),textAlign: align);

Text headingText1({required title,Color? color,double? fontSize,
  TextAlign? align,FontWeight? fontWeight})=>
    Text(title,maxLines: 3,style: GoogleFonts.openSans(fontSize: fontSize,color: color,
        fontWeight: fontWeight),textAlign: align,overflow: TextOverflow.ellipsis,);


Text headingLongText({required title,Color? color,double? fontSize,
  TextAlign? align,FontWeight? fontWeight})=>
    Text(title,style: GoogleFonts.openSans(fontSize: fontSize,color: color,
        fontWeight: fontWeight),textAlign: align,overflow: TextOverflow.ellipsis,);


Text headingShortText({required title,Color? color,double? fontSize,
  TextAlign? align,FontWeight? fontWeight})=>
    Text(title,maxLines: 2,style: GoogleFonts.openSans(fontSize: fontSize,color: color,
        fontWeight: fontWeight),textAlign: align,overflow: TextOverflow.ellipsis,);


Text headingShortLongText({required title,Color? color,double? fontSize,
  TextAlign? align,FontWeight? fontWeight})=>
    Text(title,maxLines: 3,style: GoogleFonts.openSans(fontSize: fontSize,color: color,
        fontWeight: fontWeight),textAlign: align,overflow: TextOverflow.ellipsis,);