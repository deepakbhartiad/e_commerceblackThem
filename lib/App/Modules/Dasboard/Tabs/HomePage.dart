import 'dart:async';
import 'package:e_commerce/App/Shared/sawidget/ImageView.dart';
import 'package:e_commerce/app/shared/constands/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Shared/sawidget/CustomPaints.dart';
import '../../../Shared/sawidget/LoadingOverlay.dart';
import '../../../Shared/sawidget/SACarsol.dart';
import '../../../Shared/sawidget/cell_container.dart';
import '../../../Shared/sawidget/textview.dart';
import '../Controller/DasboardController.dart';
import '../Controller/HomeController.dart';
import '../Views/ProductDeatails.dart';

class HomePage extends GetView<HomeController> {
  final StreamController<Map> streamController;
  HomePage({Key? key, required this.streamController})
      : super(
          key: key,
        );
  DashBoardController dController = Get.find<DashBoardController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              DKBottomRoundContainer(
                  radius: 30,
                  height: 190,
                  width: double.infinity,
                  color: ColorConstants.APPPRIMARYBLACKCOLOR,
                  borderWidth: 0,
                  borderWidthColor: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            searchYourProductUI(),
                            addPadding(2, 0),
                            headingText(
                                title: "Beast Collection",
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: ScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                                controller.BCTittle.length,
                                (index) => GestureDetector(
                                      onTap: () {
                                        CategoryProductUi(
                                            0,
                                            controller.BCTittle[index],
                                            controller.BCImg[index]);
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Container(
                                          // color: Colors.red,
                                          // height: 90,
                                          width: 60,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  child: Image.network(
                                                    controller.BCImg[index],
                                                    // color: Colors.white,
                                                    height: 50, width: 50,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              addPadding(3, 0),
                                              headingShortText(
                                                  title: controller
                                                      .BCTittle[index],
                                                  color: Colors.white,
                                                  fontSize: 11,
                                                  align: TextAlign.center)
                                            ],
                                          ),
                                        ),
                                      ),
                                    )),
                          ),
                        ).paddingOnly(left: 4),
                      )
                    ],
                  )),
              addPadding(16, 0),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0.0, left: 15.0, bottom: 5, right: 15),
                child: Row(
                  children: [
                    headingLongText(
                        title: "Popular Products",
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: ColorConstants.APPPRIMARYBLACKCOLOR),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        // Get.toNamed(Routes.DASHBOARD);
                        dController.updateBottomIndex(1);
                      },
                      child: headingLongText(
                          title: "View All",
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 10,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                child: GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    itemCount: 10,
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 5,
                        mainAxisExtent: 126),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(ProductDetailsView(
                            productUrl: controller.MobileIMG,
                            productName: "Apple iPhone 11",
                          ));
                        },
                        child: SACellRoundContainer(
                          radius: 20,
                          borderWidthColor: Colors.transparent,
                          borderWidth: 0,
                          color: Colors.black,
                          child: Stack(
                            fit: StackFit.expand,
                            alignment: Alignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: ImageViewCovered(
                                    photoUrl: controller.MobileIMG),
                              ),
                              Positioned(
                                  top: 7,
                                  right: 7,
                                  child: SACellRoundContainer(
                                    height: 30,
                                    width: 30,
                                    radius: 10,
                                    borderWidth: 0,
                                    borderWidthColor: Colors.transparent,
                                    color: Colors.grey,
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.white,
                                    ),
                                  )),
                              Positioned(
                                  bottom: 6,
                                  left: 9,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      headingText(
                                          title: 'Starting \u{20B9}5000',
                                          color:
                                              ColorConstants.APPPRIMARYCOLOR2,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10),
                                      headingLongText(
                                          title: "Apple iPhone 11",
                                          color: ColorConstants
                                              .APPPRIMARYWHITECOLOR,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12)
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 8,
              ),
              // first image slider
              CarouselImageSlider(context, controller.bannerUrlLList2),
              // wishlist
              Padding(
                padding: const EdgeInsets.only(
                    top: 15.0, left: 16.0, bottom: 5, right: 15),
                child: Row(
                  children: [
                    headingLongText(
                        title: "Add To Your Wishlist",
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: ColorConstants.APPPRIMARYBLACKCOLOR),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        // Get.toNamed(Routes.DASHBOARD);
                        dController.updateBottomIndex(1);
                      },
                      child: headingLongText(
                          title: "View All",
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 10,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 280,
                child: GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 13,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, mainAxisExtent: 140),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(ProductDetailsView(
                            productUrl: controller.shoues1,
                            productName: "Casual Men Shoes",
                          ));
                        },
                        child: Container(
                          // color: Colors.blue,
                          margin: EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Stack(
                                children: [
                                  SACellRoundContainer(
                                    height: 150,
                                    width: double.infinity,
                                    radius: 10,
                                    borderWidth: 1,
                                    borderWidthColor:
                                        Colors.grey.withOpacity(0.5),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: ImageViewCovered(
                                        photoUrl: controller.shoues1,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: 5,
                                      right: 5,
                                      child: SizedBox(
                                          height: 35,
                                          width: 35,
                                          child: ImageView(
                                            photoUrl: controller.offf,
                                          )))
                                ],
                              ),
                              addPadding(3, 0),
                              headingShortLongText(
                                  title: "Casual Men Shoes",
                                  fontWeight: FontWeight.w600),
                              RatingBar.builder(
                                // initialRating: astroList[i].rating.toDouble(),
                                minRating: 1,
                                direction: Axis.horizontal,
                                itemSize: 14,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  size: 10,
                                  color: Color(0xffb68f02),
                                ),
                                onRatingUpdate: (double value) {},
                              ),
                              addPadding(5, 0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      headingShortLongText(
                                          title: "\u{20B9}135",
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11),
                                      Text(
                                        "\u{20B9}145",
                                        style: TextStyle(
                                            fontSize: 11,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  SACellRoundContainer(
                                      radius: 5,
                                      borderWidth: 1,
                                      borderWidthColor: Colors.blue,
                                      color: Colors.blue.withOpacity(0.1),
                                      child: headingText(
                                              title: "ADD",
                                              color: Colors.blue,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold)
                                          .paddingSymmetric(
                                              horizontal: 13, vertical: 4))
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              GridView.builder(
                shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisExtent: 350),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(ProductDetailsView(
                          productUrl: controller.model1,
                          productName: "Casual Shirt",
                        ));
                      },
                      child: Container(
                        // color: Colors.blue,
                        margin: EdgeInsets.all(2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Stack(
                              children: [
                                SizedBox(
                                    height: 250,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(13)),
                                        child: ImageViewCovered(
                                            photoUrl: controller.model1))),
                                Positioned(
                                    top: 7,
                                    right: 7,
                                    child: SACellRoundContainer(
                                      height: 30,
                                      width: 30,
                                      radius: 10,
                                      borderWidth: 0,
                                      borderWidthColor: Colors.transparent,
                                      color: Colors.grey,
                                      child: Icon(
                                        Icons.favorite_border,
                                        color: Colors.white,
                                      ),
                                    )),
                              ],
                            ),
                            addPadding(5, 0),
                            headingText(
                                title: "Casual Shirt",
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                            addPadding(5, 0),
                            RatingBar.builder(
                              // initialRating: astroList[i].rating.toDouble(),
                              minRating: 1,
                              direction: Axis.horizontal,
                              itemSize: 15,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                size: 10,
                                color: Color(0xffb68f02),
                              ),
                              onRatingUpdate: (double value) {},
                            ),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    headingShortLongText(
                                        title: "\u{20B9}670",
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11),
                                    Text(
                                      "\u{20B9}750",
                                      style: TextStyle(
                                          fontSize: 11,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                                SACellRoundContainer(
                                    radius: 5,
                                    borderWidth: 1,
                                    borderWidthColor: Colors.blue,
                                    color: Colors.blue.withOpacity(0.1),
                                    child: headingText(
                                            title: "ADD",
                                            color: Colors.blue,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold)
                                        .paddingSymmetric(
                                            horizontal: 13, vertical: 4))
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
              CarouselImageSlider(context, controller.bannerUrlLList)
            ],
          ),
        ),
      ),
    );
  }

  void CategoryProductUi(int tblPanditPujaId, String Tittle, String url) {
    Get.bottomSheet(isScrollControlled: true, enableDrag: true, StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  CupertinoIcons.clear_circled,
                  color: Colors.white,
                )),
            Container(
              height: 620,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: ColorConstants.APPPRIMARYWHITECOLOR,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 85,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    child: ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                        child: CustomPaint(
                          painter: BottomSheetPaint(),
                        )),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              headingText(
                                  title: "${Tittle}",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: ColorConstants.APPPRIMARYBLACKCOLOR1),
                              headingText(
                                  title: "${"see all"}",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: ColorConstants.APPSECONDARYCOLOR),
                            ],
                          ).paddingSymmetric(horizontal: 10),
                          addPadding(5, 0),
                          SizedBox(
                            height: 700,
                            child: GridView.builder(
                                // padding: EdgeInsets.symmetric(horizontal: 10),
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 4,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2, mainAxisExtent: 350),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(ProductDetailsView(
                                        productUrl: url,
                                        productName: "$Tittle",
                                      ));
                                    },
                                    child: Container(
                                      // color: Colors.blue,
                                      margin: EdgeInsets.all(5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Stack(
                                            children: [
                                              SizedBox(
                                                  height: 250,
                                                  child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.vertical(
                                                              top: Radius
                                                                  .circular(
                                                                      13)),
                                                      child: ImageViewCovered(
                                                          photoUrl: url))),
                                              Positioned(
                                                  top: 7,
                                                  right: 7,
                                                  child: SACellRoundContainer(
                                                    height: 30,
                                                    width: 30,
                                                    radius: 10,
                                                    borderWidth: 0,
                                                    borderWidthColor:
                                                        Colors.transparent,
                                                    color: Colors.grey,
                                                    child: Icon(
                                                      Icons.favorite_border,
                                                      color: Colors.white,
                                                    ),
                                                  )),
                                            ],
                                          ),
                                          addPadding(5, 0),
                                          headingText(
                                              title: "$Tittle",
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                          addPadding(5, 0),
                                          RatingBar.builder(
                                            // initialRating: astroList[i].rating.toDouble(),
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            itemSize: 15,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemBuilder: (context, _) =>
                                                const Icon(
                                              Icons.star,
                                              size: 10,
                                              color: Color(0xffb68f02),
                                            ),
                                            onRatingUpdate: (double value) {},
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  headingShortLongText(
                                                      title: "\u{20B9}670",
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 11),
                                                  Text(
                                                    "\u{20B9}750",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                        color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                              SACellRoundContainer(
                                                  radius: 5,
                                                  borderWidth: 1,
                                                  borderWidthColor: Colors.blue,
                                                  color: Colors.blue
                                                      .withOpacity(0.1),
                                                  child: headingText(
                                                          title: "ADD",
                                                          color: Colors.blue,
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold)
                                                      .paddingSymmetric(
                                                          horizontal: 13,
                                                          vertical: 4))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    ));
  }

  Widget CarouselImageSlider(BuildContext context, RxList bannerUrlLList) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: bannerUrlLList.isEmpty
          ? PageNationLoaderPage()
          : SACarousel(
               width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
             list: bannerUrlLList.map((e) =>  GestureDetector(
          onTap: () {
            // Get.to(AllMovieAndSerialDetails(movieId: e.MovieID,));
          },
          child: SACellGradientContainer(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headingText(
                        title: "MacBook Pro",
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16),
                    headingText(
                        title: "From \u{20B9}50000",
                        color: ColorConstants.APPPRIMARYCOLOR2,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                    SizedBox(
                      height: 10,
                    ),
                    SACellRoundContainer(
                      radius: 5,
                      borderWidth: 0,
                      color: Colors.blue,
                      borderWidthColor: Colors.transparent,
                      child: headingText(
                          title: "Book Now",
                          fontSize: 11,
                          color: Colors.white,
                          fontWeight: FontWeight.w600)
                          .paddingAll(5),
                    )
                  ],
                ),
                SizedBox(
                  height: 170,
                  width: 170,
                  child: ImageView(photoUrl: e),
                ),
              ],
            ),
            borderRadius: 20,
            GRcolor: [Colors.grey, Colors.black],
          ).paddingSymmetric(horizontal: 8),
        )).toList(),
            ),
    );
  }


  searchYourProductUI() {
    return SizedBox(
      height: 55,
      child: TextFormField(
        // controller: controller.editSearchController.value,
        decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
              size: 16,
              color: Color(0xff818181),
            ),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    // controller.editSearchController.value.clear();
                    // controller.isVisibilitySearchBarUI.value = false;
                  },
                  child: Icon(Icons.cancel_outlined,
                      size: 20, color: Color(0xff818181)),
                ),
                addPadding(0, 15),
                Icon(Icons.mic, size: 20, color: Color(0xff818181)),
                addPadding(0, 10),
              ],
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(width: 1.0, color: Color(0xffece7e7))),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(width: 1.0, color: Color(0xffece7e7))),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 1, color: Color(0xffe9e9ea)),
            ),
            contentPadding: const EdgeInsets.only(top: 20, left: 15),
            hintText: "Search For Product",
            hintStyle: GoogleFonts.openSans(
                color: ColorConstants.APPPRIMARYLIGHTBLACKCOLOR,
                fontSize: 12,
                fontWeight: FontWeight.w600),
            filled: true,
            fillColor: ColorConstants.APPPRIMARYWHITECOLOR),
        onChanged: (value) {
          /*if (value.isNotEmpty) {
            controller.pageNumberVal.value = 1;
            controller.searchYourPujaAPIs(value.toString().trim());
          } else {
            controller.isVisibilitySearchBarUI.value = false;
          }*/
        },
      ),
    );
  }
}
