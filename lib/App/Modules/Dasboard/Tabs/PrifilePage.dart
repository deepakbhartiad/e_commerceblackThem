import 'package:e_commerce/App/Modules/Dasboard/Controller/DasboardController.dart';
import 'package:e_commerce/App/Shared/constands/colors.dart';
import 'package:e_commerce/App/Shared/sawidget/cell_container.dart';
import 'package:e_commerce/App/Shared/sawidget/textview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Rough.dart';
import '../../../Shared/sawidget/CommonButton.dart';
import '../../../Shared/sawidget/CustomPaints.dart';
import '../../../Shared/sawidget/ImageView.dart';
import '../../../Shared/sawidget/textfield.dart';
import '../Controller/HomeController.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  HomeController hController = Get.find<HomeController>();
  DashBoardController dController = Get.find<DashBoardController>();



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 110,
                  padding: EdgeInsets.only(bottom: 40),
                  width: MediaQuery.of(context).size.width,
                  child: CustomPaint(
                    painter: ProfilePagePaint2(),
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white.withOpacity(0.1),),
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.white.withOpacity(0.1),),
                      ],
                    ).paddingOnly(right: 30,bottom: 50),
                  ),
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        /* boxShadow: const [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 4.0,
                                        offset: Offset(2, 2),
                                        spreadRadius: 1)
                                  ],*/
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.white,width: 2)

                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: ImageViewFill(
                          photoUrl: hController.ProfileIMG,
                        ),
                      ),
                    ),
                    Container(
                      height: 22,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
                      ),
                      child: Center(
                        child: Icon(Icons.camera_alt,color: Colors.white,size: 14,).paddingOnly(bottom: 2),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Align(
                alignment: Alignment.center,
                child: headingText(title: "Guest User",fontWeight: FontWeight.bold)),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addPadding(5, 0),
                  headingText(title: "Your Information",fontWeight: FontWeight.bold,color: ColorConstants.APPPRIMARYBLACKCOLOR.withOpacity(0.6)),
                  addPadding(12, 0),
                  SACellRoundContainer(
                      color: ColorConstants.APPPRIMARYBLACKCOLOR.withOpacity(0.8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CustomPaint(
                          painter: HorizentalCardPaint(),
                          child: Column(
                            children: [
                              ListTile(
                                minVerticalPadding: 5,
                                contentPadding: EdgeInsets.zero,
                                leading: CircleAvatar(
                                    backgroundColor: ColorConstants.APPSECONDARYCOLOR.withOpacity(0.2),

                                    child: Icon(Icons.fastfood_outlined,color: Colors.white,)),
                                title:  headingText(title: "Your Order",fontSize: 15,color: Colors.white),
                                trailing: Icon(Icons.arrow_forward_ios_rounded,size: 11,color: Colors.grey,),
                              ),
                              ListTile(
                                minVerticalPadding: 5,
                                contentPadding: EdgeInsets.zero,
                                leading: CircleAvatar(
                                    backgroundColor: ColorConstants.APPSECONDARYCOLOR.withOpacity(0.2),

                                    child: Icon(Icons.location_on_outlined,color: Colors.white,)),
                                title:  headingText(title: "Your Address",fontSize: 15,color: Colors.white),
                                trailing: Icon(Icons.arrow_forward_ios_rounded,size: 11,color: Colors.grey,),
                              ),
                              ListTile(
                                minVerticalPadding: 5,
                                contentPadding: EdgeInsets.zero,
                                leading: CircleAvatar(
                                    backgroundColor: ColorConstants.APPSECONDARYCOLOR.withOpacity(0.2),
                                    child: Icon(Icons.favorite_border,color: Colors.white,)),
                                title:  headingText(title: "Wishlist",fontSize: 15,color: Colors.white),
                                trailing: Icon(Icons.arrow_forward_ios_rounded,size: 11,color: Colors.grey,),
                              ),
                              ListTile(
                                minVerticalPadding: 5,
                                contentPadding: EdgeInsets.zero,
                                leading: CircleAvatar(
                                    backgroundColor: ColorConstants.APPSECONDARYCOLOR.withOpacity(0.2),
                                    child: Icon(Icons.history,color: Colors.white,)),
                                title:  headingText(title: "Your History",fontSize: 15,color: Colors.white),
                                trailing: Icon(Icons.arrow_forward_ios_rounded,size: 11,color: Colors.grey,),
                              ),
                            ],
                          ).paddingSymmetric(horizontal: 10),
                        ),
                      ),
                      radius: 15, borderWidth: 0, borderWidthColor: Colors.transparent),
                  addPadding(12, 0),
                  headingText(title: "Other Information",fontWeight: FontWeight.bold,color: ColorConstants.APPPRIMARYBLACKCOLOR.withOpacity(0.6)),
                  addPadding(12, 0),
                  GestureDetector(
                    onTap: ()=>Get.to(ProfilePaget()),
                    child:
                    SACellRoundContainer(
                        color: ColorConstants.APPPRIMARYBLACKCOLOR.withOpacity(0.8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CustomPaint(
                            painter: HorizentalCardPaint(),
                            child: Column(
                              children: [
                                ListTile(
                                  minVerticalPadding: 5,
                                  contentPadding: EdgeInsets.zero,
                                  leading: CircleAvatar(
                                      backgroundColor: ColorConstants.APPSECONDARYCOLOR.withOpacity(0.2),

                                      child: Icon(Icons.headset_mic_outlined,color: Colors.white,)),
                                  title:  headingText(title: "Help Center",fontSize: 15,color: Colors.white),
                                  trailing: Icon(Icons.arrow_forward_ios_rounded,size: 11,color: Colors.grey,),
                                ),
                                ListTile(
                                  minVerticalPadding: 5,
                                  contentPadding: EdgeInsets.zero,
                                  leading: CircleAvatar(
                                      backgroundColor: ColorConstants.APPSECONDARYCOLOR.withOpacity(0.2),

                                      child: Icon(CupertinoIcons.question_circle,color: Colors.white,)),
                                  title:  headingText(title: "About Us",fontSize: 15,color: Colors.white),
                                  trailing: Icon(Icons.arrow_forward_ios_rounded,size: 11,color: Colors.grey,),
                                ),
                                ListTile(
                                  minVerticalPadding: 5,
                                  contentPadding: EdgeInsets.zero,
                                  leading: CircleAvatar(
                                      backgroundColor: ColorConstants.APPSECONDARYCOLOR.withOpacity(0.2),
                                      child: Icon(Icons.library_books,color: Colors.white,)),
                                  title:  headingText(title: "Terms of Use",fontSize: 15,color: Colors.white),
                                  trailing: Icon(Icons.arrow_forward_ios_rounded,size: 11,color: Colors.grey,),
                                ),

                                ListTile(
                                  minVerticalPadding: 5,
                                  contentPadding: EdgeInsets.zero,
                                  leading: CircleAvatar(
                                      backgroundColor: ColorConstants.APPSECONDARYCOLOR.withOpacity(0.2),
                                      child: Icon(Icons.share,color: Colors.white,)),
                                  title:  headingText(title: "Share the app",fontSize: 15,color: Colors.white),
                                  trailing: Icon(Icons.arrow_forward_ios_rounded,size: 11,color: Colors.grey,),
                                ),
                              ],
                            ).paddingSymmetric(horizontal: 10),
                          ),
                        ),
                        radius: 15, borderWidth: 0, borderWidthColor: Colors.transparent),
                  ),
                  addPadding(12, 0),
                  GestureDetector(

                    onTap: (){
                      logoutDialogUI(context);
                    },

                    child: Card(

                      color: ColorConstants.APPPRIMARYBLACKCOLOR.withOpacity(0.8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: CustomPaint(
                        painter: HorizentalCardPaint(),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.logout_outlined,color: Colors.red,
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "LOGOUT",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,color: Colors.red,
                                          fontSize: 15),
                                    ),


                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            )



          ],
        ),
      ),
    );
  }

  logoutDialogUI(BuildContext context) {
    showGeneralDialog(
        barrierDismissible: false,
        context: context,
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Center(
            child: Material(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Container(
                  decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0))),
                  height: 260.0,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Column(
                      children: [
                        addPadding(15, 0),
                        headingText(
                            title: "Logout",
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: ColorConstants.APPPRIMARYBLACKCOLOR1),
                        addPadding(25, 0),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0, right: 25),
                          child: headingLongText(
                              title: "Are you sure you want to logout?",
                              fontWeight: FontWeight.w500,
                              align: TextAlign.center,
                              fontSize: 15,
                              color: ColorConstants.APPLIGHTPRIMARYCOLOR),
                        ),
                        addPadding(30, 0),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 0, bottom: 20),
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xffFFA513),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(26.0),
                                splashColor: Colors.black26,
                                onTap: () {
                                  // setuserLoginModel(null).whenComplete(() {
                                  //   setUpdateProfileStatus("0")
                                  //       .whenComplete(() {
                                  //     Get.offAllNamed(Routes.LOGIN);
                                  //   });
                                  // });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text(
                                        "YES",
                                        style: GoogleFonts.openSans(
                                            color: Color(0xffffffff),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: CommonButtonUI(
                            text: "NO",
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }


  EditNameEmailDialogUI(BuildContext context) {
    showGeneralDialog(
        barrierDismissible: false,
        context: context,
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Center(
            child: Material(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Container(
             color: Colors.transparent,
                  height: 300.0,
                  width: double.infinity,
                  child: Column(

                    children: [
                      IconButton(onPressed: (){
                        Get.back();
                      }, icon: Icon(CupertinoIcons.clear_circled,color: Colors.white,)),
                      Expanded(
                        child: Container(
                          decoration: ShapeDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  ColorConstants.APPSECONDARYCOLOR,
                                  ColorConstants.APPPRIMARYBLACKCOLOR,
                                  ColorConstants.APPPRIMARYLIGHTGREYCOLOR,
                                  ColorConstants.APPPRIMARYBLACKCOLOR,
                                ], // Specify your gradient colors
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0))),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                            child: Column(
                              children: [
                                addPadding(15, 0),
                                headingText(
                                    title: "Change your Info",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: ColorConstants.APPPRIMARYWHITECOLOR),
                                addPadding(25, 0),

                                SACellRoundContainer(
                                  color: Colors.grey.withOpacity(0.5),
                                  radius: 8,
                                  borderWidth: 0,
                                  borderWidthColor: Colors.transparent,
                                  child: Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: SAIconTextField(
                                      hintText: 'Your Email',
                                      controller: dController.editEmail.value,

                                    ),
                                  ),
                                ),

                                addPadding(10, 0),

                                SACellRoundContainer(
                                  color: Colors.grey.withOpacity(0.5),
                                  radius: 8,
                                  borderWidth: 0,
                                  borderWidthColor: Colors.transparent,
                                  child: Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: SANumberTextField(
                                      hintText: 'Your Name',
                                      controller: dController.editName.value,

                                    ),
                                  ),
                                ),
                                addPadding(20, 0),
                                Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(7),
                                    child: CustomPaint(
                                      painter: CardPaint(),
                                      child: CommonButtonUI(
                                        bgColor: Colors.black.withOpacity(0.5),
                                        text: "SUBMIT",
                                        onPressed: () {
                                          Get.back();
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }


}





