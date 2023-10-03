



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constands/colors.dart';


Container NoRecord() => Container(child: Center(
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
   //    Image.asset("assets/loader.gif", color: ColorConstants.appPrimarylightBlackColor),
       const Icon(Icons.file_present, color: Colors.black38, size: 40,),
      Container(margin: const EdgeInsets.all(4), height: 1, width: 120,
        color: ColorConstants.APPPRIMARYLIGHTBLACKCOLOR,),
      Container(margin: const EdgeInsets.all(4), height: 1, width: 100, color:
      ColorConstants.APPPRIMARYLIGHTBLACKCOLOR,),
      const Text('No_Records', style: TextStyle(color: ColorConstants.APPPRIMARYLIGHTBLACKCOLOR))
    ],),
),);


Container SACellRoundContainer({required Widget child,
      Color? color,double? width,double? height,required double radius,
  required double borderWidth,required Color borderWidthColor})=>Container(
  child: child,
  height: height,
  width: width,
  decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius!),
      border: Border.all(width: borderWidth!,color: borderWidthColor!)
  ),
);

DKBottomRoundContainer({

  required Widget child,
  Color? color,double? width,double? height,
  required double radius,
  required double borderWidth,required Color borderWidthColor
})=>Container(
  child: child,
  height: height,
  width: width,
  decoration: BoxDecoration(
      color: ColorConstants.APPPRIMARYBLACKCOLOR,
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(radius!)),
      border: Border.all(width: borderWidth!,color: borderWidthColor!),
    // gradient: LinearGradient(
    //   colors: [
    //     Colors.white,
    // ColorConstants.APPPRIMARYBLACKCOLOR,
    // ColorConstants.APPPRIMARYBLACKCOLOR,
    //
    //   ],
    //   begin: Alignment.topLeft,
    //   end: Alignment.bottomRight,
    // )
  ),
);


Container SACELLSHODOWCONTAINER({
  required Widget child,
  Color? color,
  double? width,
  double? height,
  required double radius,
}) =>
    Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
          color: ColorConstants.APPPRIMARYWHITECOLOR,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 2),
                blurRadius: 3,
                color: Colors.grey.withOpacity(0.5))
          ]),child: child,
    );

Container SACellGradientContainer({required Widget child,EdgeInsets padding=const EdgeInsets.all(15),
  Color? color,required List<Color>GRcolor,double? width,double? height,required double? borderRadius,})=>Container(
  child: child,
  height: height,
  padding: padding,
  width: width,
  decoration: BoxDecoration(
    gradient: LinearGradient(colors: GRcolor,
        begin: Alignment.topLeft,end: Alignment.bottomRight),
      color: null,
      borderRadius: BorderRadius.circular(borderRadius!),
  ),
);



Container SACellContainerRoundWithOutBorder({required Widget child,EdgeInsets padding=const EdgeInsets.all(15),
  Color? color,double? width,double? height,required double? borderRadius,})=>Container(
  child: child,
  height: height,
  padding: padding,
  width: width,
  decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(borderRadius!),
  ),
);



Container SACelBottomRoundContainer({required Widget child,
  Color? color,double? width,double? height})=>Container(
  child: child,
  height: height,
  width: width,
  decoration: const BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomCenter,
        colors: [Color(0xffeff0f4),Color(0xffe0e6f2)]),
      borderRadius: BorderRadius.only(bottomRight: Radius.circular(95),
          bottomLeft: Radius.circular(95))
  ),
);



Container SACellGradient({required Widget child,
  Color? color,double? width,double? height,required double radius,
  required double borderWidth,required Color borderWidthColor})=>Container(
  child: child,
  height: height,
  width: width,
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
      color: color,
      borderRadius: BorderRadius.circular(22),
  ),
);



Container SACellShadowContainer({required Widget child,
  Color? color,double? width,double? height,required double radius,
  })=>Container(
  child: child,
  height: height,
  width: width,
  decoration: BoxDecoration(
    boxShadow: [
      BoxShadow(offset: Offset(2,2),blurRadius: 4,color: Colors.grey.withOpacity(0.5))
    ],
    color: color,
    borderRadius: BorderRadius.circular(22),
  ),
);

Container SACellRoundContainer2({required Widget child,
  Color? color,double? width,double? height,required double radius,
  required double borderWidth,required Color borderWidthColor})=>Container(
  child: child,
  height: height,
  width: width,
  decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius!),
      border: Border.all(width: borderWidth!,color: borderWidthColor!),
      boxShadow: const [
        BoxShadow(
          color: Color(0xff969696),
          blurRadius: 3,
          offset: Offset(1, 3),
        ),
      ]
  ),
);

Container SACellGradientContainer1({required Widget child,
  Color? color,double? width,double? height})=>Container(
  
  child: child,
  height: height,
  width: width,
  decoration: BoxDecoration(

    color: ColorConstants.APPPRIMARYCOLOR,
    
  ),
);

Container SACellUperRoundContainer({required Widget child,
  Color? color,double? width,double? height})=>Container(
    child: child,
    height: height,
    width: width,
    decoration: BoxDecoration(
        color: ColorConstants.APPPRIMARYWHITECOLOR,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(55),
            topRight: Radius.circular(55)))
);

