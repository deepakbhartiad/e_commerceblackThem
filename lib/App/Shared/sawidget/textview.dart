


import 'package:e_commerce/App/Shared/constands/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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


RichText headingRichText({required FirstTitle,required SecondTitle,Color? color,double? fontSize,
  TextAlign? align,FontWeight? fontWeight}){
  return RichText(
    text: TextSpan(
      style: GoogleFonts.openSans(),
      children: <TextSpan>[
        TextSpan(
          text: FirstTitle,
          style: TextStyle(fontWeight: FontWeight.w600,color: ColorConstants.APPPRIMARYBLACKCOLOR,fontSize: 12),
        ),
        TextSpan(
          text: SecondTitle,
          style: TextStyle(fontWeight:FontWeight.w500,color: ColorConstants.APPPRIMARYBLACKCOLOR,fontSize: 12),
        ),

      ],
    ),
  );
}



