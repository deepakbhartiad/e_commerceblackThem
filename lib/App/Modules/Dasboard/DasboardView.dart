import 'dart:async';
import 'dart:io';

import 'package:e_commerce/App/Modules/Dasboard/Controller/HomeController.dart';
import 'package:e_commerce/App/Modules/Dasboard/Tabs/CartPage.dart';
import 'package:e_commerce/App/Shared/sawidget/ImageView.dart';
import 'package:e_commerce/App/Shared/sawidget/cell_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Shared/constands/colors.dart';
import '../../Shared/sawidget/CommonButton.dart';
import '../../Shared/sawidget/CustomPaints.dart';
import '../../Shared/sawidget/textfield.dart';
import '../../Shared/sawidget/textview.dart';
import 'Controller/DasboardController.dart';
import 'Tabs/HomePage.dart';
import 'Tabs/PrifilePage.dart';

class DashBoardPage extends GetView<DashBoardController> {
  DashBoardPage({super.key});
  HomeController hController = Get.find<HomeController>();

  final PageController pageController = PageController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final StreamController<Map> streamController =
  StreamController<Map>.broadcast();
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      HomePage(
        streamController: streamController,
      ),
      Container(),
      CartPage(),
      ProfilePage(),


    ];

    return WillPopScope(
      onWillPop: () {
        if (controller.bottomNavIndex.value == 0) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.white,
                title: Text("Exit?",
                    style:
                    GoogleFonts.inter(color: Colors.black, fontSize: 15.0)),
                content: new Text("Are you sure you want to exit?",
                    style:
                    GoogleFonts.inter(color: Colors.black, fontSize: 15.0)),
                actions: <Widget>[
                  new TextButton(
                    child: new Text(
                      "CANCEL",
                      style: TextStyle(
                        color: Colors.red,
                        fontFamily: 'Helvetica Neue',
                        fontSize: 14.8,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),

                  new TextButton(
                    child: new Text(
                      "OK",
                      style: TextStyle(
                        color: Colors.red,
                        fontFamily: 'Helvetica Neue',
                        fontSize: 14.8,
                      ),
                    ),
                    onPressed: () {
                      exit(0);
                    },
                  ),
                  // usually buttons at the bottom of the dialog
                ],
              );
            },
          );
        } else {
          controller.isSelectedTopic.value = 0;
          controller.PopulerCategoryIndex.value = 0;
          controller.bottomNavIndex.value = 0;
          controller.orderHistoryIcon.value = false;
          controller.pujaBookingIcon.value = false;
          controller.callAstroIcon.value = false;
          controller.profileIcon.value = false;
          controller.homeIcon.value = true;
          controller.shareIcon.value = false;
          controller.bottomNavIndex.value = 0;
        }

        return Future.value(false);
      },
      child: GetX(
        init: DashBoardController(),
        builder: (_) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: PreferredSize(
              preferredSize:
             /* controller.bottomNavIndex.value == 3 ?
           Size.fromHeight(0):*/
              Size.fromHeight(60),
              child: Container(


                decoration: BoxDecoration(
                  color: ColorConstants.APPPRIMARYBLACKCOLOR,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(
                      controller.bottomNavIndex.value == 1
                      ? 25 : controller.bottomNavIndex.value == 2?25:0))
                ),
                child: AppBar(
                iconTheme: IconThemeData(color: Colors.white),
                elevation: 0,
                backgroundColor:  Colors.transparent,
                centerTitle: true,
                title:
                headingText(title: "E-commerce",color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),
                actions: [
                  controller.bottomNavIndex.value == 3 ?
                  GestureDetector(
                    onTap: (){
                      EditNameEmailDialogUI(context);
                    },
                    child: SACellRoundContainer(
                        height: 30,width: 35,
                        color:  ColorConstants.APPPRIMARYLIGHTGREYCOLOR,
                        child: Center(child: Icon(
                          Icons.edit_outlined,
                          size: 20,
                          color:ColorConstants.APPPRIMARYWHITECOLOR,
                        ),),
                        radius: 8,
                        borderWidth: 0,
                        borderWidthColor: Colors.transparent
                    ),
                  ):
                  SizedBox(
                    height: 40,width: 40,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: ImageViewCovered(
                        photoUrl: hController.ProfileIMG,

                ),
                    ),
                  ),addPadding(0, 15),

                ],
            ),
              ),
      ),

            drawer: Drawer(),
            body: Stack(
              children: [
                children[controller.bottomNavIndex.value!.toInt()],
                controller.bottomNavIndex.value == 0
                    ? Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 6.0, left: 10, right: 10),
                    child: Row(
                      children: [


                      ],
                    ),
                  ),
                )
                    : const SizedBox()
              ],
            ),
            bottomNavigationBar: createBottomNavigationUI(),
          );
        },
      ),
    );
  }

  createBottomNavigationUI() {
    return Obx(() => Container(
      height: 85,
      color: Colors.transparent,
      child: CustomPaint(
       painter: DesignPaint(),
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: BottomNavigationBar(
            useLegacyColorScheme: false,
            elevation: 0,
            backgroundColor: Colors.transparent,
            showUnselectedLabels: true,
            unselectedFontSize: 9,
            selectedFontSize: 10,
            type: BottomNavigationBarType.fixed,
            selectedIconTheme: const IconThemeData(
                color: ColorConstants.APPPRIMARYLIGHTGREYCOLOR
            ),
            showSelectedLabels: true,
            unselectedLabelStyle: GoogleFonts.openSans(
                color: ColorConstants.APPPRIMARYLIGHTGREYCOLOR,
                fontWeight: FontWeight.w400),
            selectedLabelStyle: GoogleFonts.openSans(
                color:Colors.white,
                fontWeight: FontWeight.w400),
            currentIndex: controller.bottomNavIndex.value,
            unselectedItemColor: const Color(0xff818181),
            selectedItemColor: ColorConstants.APPPRIMARYWHITECOLOR,
            onTap: (index) {
              controller.isSelectedTopic.value = 0;
              controller.PopulerCategoryIndex.value = 0;
              controller.updateBottomIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                backgroundColor: Colors.transparent,
                  icon: Icon(
                    Icons.home,
                    color: controller.homeIcon.value
                        ? Colors.white
                        : Colors.grey,
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.notifications,
                    color: controller.callAstroIcon.value
                        ? Colors.white
                        : Colors.grey,
                  ),
                  label: "Notification"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: controller.pujaBookingIcon.value
                        ? Colors.white
                        : Colors.grey,
                  ),
                  label: "Cart"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_rounded,
                    color: controller.orderHistoryIcon.value
                        ? Colors.white
                        : Colors.grey,
                  ),
                  label: "Profile"),
              // BottomNavigationBarItem(
              //     icon:Container(
              //       width: controller.bottomNavIndex.value == 4 ? 28 : 24,
              //       height: controller.bottomNavIndex.value == 4 ? 28 : 24,
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(25),
              //           border: Border.all(
              //               color: controller.bottomNavIndex.value == 4
              //                   ? ColorConstants.APPPRIMARYCOLOR
              //                   : ColorConstants.APPPRIMARYLIGHTGREYCOLOR,
              //               width:
              //               controller.bottomNavIndex.value == 4 ? 2 : 0)),
              //       child:  ClipOval(
              //         child: FancyShimmerImage(
              //           imageUrl: controller.userProfile.value,
              //           boxFit: BoxFit.cover,
              //           shimmerBaseColor: ColorConstants
              //               .APPPRIMARYLIGHTBLACKCOLOR
              //               .withOpacity(0.2),
              //           shimmerHighlightColor: ColorConstants
              //               .APPPRIMARYLIGHTBLACKCOLOR
              //               .withOpacity(0.5),
              //           shimmerBackColor: ColorConstants
              //               .APPPRIMARYLIGHTBLACKCOLOR
              //               .withOpacity(0.7),
              //           errorWidget: Image.asset("assets/placeholder.png"),
              //         ),
              //       ),
              //
              //     ),
              //
              //     label: "Profile"),

            ],
          ),
        ),

      )
    ));
  }

  flogoutUI(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28.0, right: 28.0, top: 20),
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(26.0),
            splashColor: Colors.black26,
            onTap: () {
              logoutDialogUI(context);
            },
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.logout,
                    size: 20,
                  ),
                  Text(
                    "Log Out",
                    style: GoogleFonts.openSans(
                        color: Color(0xffffffff),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
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
                                      controller: controller.editEmail.value,

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
                                      controller: controller.editName.value,

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



class DesignPaint  extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        ColorConstants.APPPRIMARYCOLOR, // Start color
        ColorConstants.APPPRIMARYCOLOR, // Start color
        // Color(0xFF00CCFF), // Middle color
        ColorConstants.APPPRIMARYCOLOR2, // End color
      ],
      // stops: [0.0, 0.5, 1.0], // Adjust the color distribution along the gradient
    );


    final paint = Paint();
    paint.color = ColorConstants.APPPRIMARYBLACKCOLOR;
    // paint.strokeCap = StrokeCap.round;
    paint.style = PaintingStyle.fill;
  //  paint.shader = gradient.createShader(Rect.fromPoints(Offset(5, 2), Offset(size.width, size.height)));
    paint.strokeWidth = 7;

    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(size.width-12, size.height*0.35, size.width-50, size.height*0.30);
     path.lineTo(size.width-size.width+50, size.height*0.34);
     path.quadraticBezierTo(size.width-size.width+16,size.height*0.34, size.width-size.width, size.height-size.height);
     path.close();

    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
