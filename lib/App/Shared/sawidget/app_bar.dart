


import 'package:e_commerce/App/Shared/sawidget/textview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constands/colors.dart';
import 'back_button.dart';

class SAppBar extends StatelessWidget {

  String title;
  Color color=ColorConstants.APPPRIMARYLIGHTBLACKCOLOR;
   SAppBar({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(right:15.0),
      child: Row(children: [
        SABackButton(color: color,onPressed: (){
          Get.back();
        }),
        const Spacer(),
        headingFullText(title: title,fontSize: 16,fontWeight: FontWeight.w600),
        const Spacer(),
        const Icon(
          Icons.search,
          color: ColorConstants.APPPRIMARYLIGHTBLACKCOLOR,
          size: 23,
        ),
        const SizedBox(
          width: 16,
        ),
        const Icon(
          Icons.notifications,

          // Ionicons.notifications_outline,
          color: ColorConstants.APPPRIMARYLIGHTBLACKCOLOR,
          size: 23,
        ),


      ],),
    );
  }
}
