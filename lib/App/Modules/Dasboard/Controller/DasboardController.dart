import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'HomeController.dart';

class DashBoardController extends GetxController with WidgetsBindingObserver{
  var editEmail = TextEditingController().obs;
  var editName = TextEditingController().obs;


  final bottomNavIndex = 0.obs,
      appBarTitle = "EaseMyPuja".obs,
      isPopulerCategory = 0.obs,
      PopulerCategoryIndex = 0.obs;
  final homeIcon = false.obs,
      callAstroIcon = false.obs,
      pujaBookingIcon = false.obs,
      orderHistoryIcon = false.obs,
      profileIcon = false.obs,
      shareIcon = false.obs;

  final walletAmount = "0".obs,
      submitRatingValue = 5.0.obs,
      isAnonymous = false.obs;
  var editSubmitReviewController = TextEditingController().obs;

  final isSelectedTopic = 0.obs, isVisibilitySearchBarUI = false.obs;
  final userProfile = "".obs;
  final pageSizeVal = 10.obs,
      pageNumberVal = 1.obs,
      isPageNationProgress = false.obs;


  final currentTime = 0.obs,
      endTime = 0.obs,
      minDuration = 0.obs,
      maxDuration = 0.obs,
      currentDuration = 0.obs,
      isPlaying = false.obs,
      isSeekBarValue = true.obs,
      currentpostlabel = "00:00".obs,
      seekVal = 0.obs,
      noOfNotificationValue = "0".obs,
      isInitalValue = false.obs;

  void updateBottomIndex(int index) {
    bottomNavIndex.value = index;
    isVisibilitySearchBarUI.value = false;
/*    checkReviewForCall();
    checkReviewStaus();
    getProfileDetail();
    notificationOfNumbersAPIs();*/
    if (bottomNavIndex.value == 0) {
      orderHistoryIcon.value = false;
      pujaBookingIcon.value = false;
      callAstroIcon.value = false;
      homeIcon.value = true;
      shareIcon.value = false;
      profileIcon.value = false;
      appBarTitle.value = "ShriArambh";
    } else if (bottomNavIndex.value == 1) {
      callAstroIcon.value = true;
      pujaBookingIcon.value = false;
      orderHistoryIcon.value = false;
      homeIcon.value = false;
      shareIcon.value = false;
      profileIcon.value = false;
      appBarTitle.value = "Call with Astrologer";
    } else if (bottomNavIndex.value == 2) {
      pujaBookingIcon.value = true;
      callAstroIcon.value = false;
      orderHistoryIcon.value = false;
      homeIcon.value = false;
      isPopulerCategory.value = 0;
      profileIcon.value = false;
      shareIcon.value = false;
      appBarTitle.value = "Book Your Puja";
    } else if (bottomNavIndex.value == 3) {
      orderHistoryIcon.value = true;
      pujaBookingIcon.value = false;
      callAstroIcon.value = false;
      homeIcon.value = false;
      shareIcon.value = false;
      profileIcon.value = false;
      appBarTitle.value = "Order History";
    } else if (bottomNavIndex.value == 4) {

      // FlutterShare.share(
      //   title: "Share App",
      //   text:
      //       'Hey, I use the EaseMyPuja App for my Home Pujas without being worried about the Puja Samagri 😊.\nConsult with their experienced Pandits and Book them for your next Home Puja TODAY!',
      //   linkUrl:
      //       'https://play.google.com/store/apps/details?id=com.apps.easemypuja',
      // );
      // isSelectedTopic.value = 0;
      // PopulerCategoryIndex.value = 0;
      // bottomNavIndex.value = 0;
      orderHistoryIcon.value = false;
      pujaBookingIcon.value = false;
      callAstroIcon.value = false;
      homeIcon.value = false;
      profileIcon.value = true;
      shareIcon.value = false;
      // appBarTitle.value = "Profile";
    }
  }

  @override
  void onClose() {
    super.onClose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void onInit() {
    print("dkfldkjfljlkjlkdsjladjkslakljskjdfkjlsf");

    super.onInit();
    WidgetsBinding.instance.addObserver(this);
/*    getProfileDetail();
    checkReviewStaus();
    checkReviewForCall();
    populerCategory();*/
    isSelectedTopic.value = 0;
    PopulerCategoryIndex.value = 0;
    bottomNavIndex.value = 0;
    orderHistoryIcon.value = false;
    pujaBookingIcon.value = false;
    callAstroIcon.value = false;
    homeIcon.value = true;
    shareIcon.value = false;
    //notificationOfNumbersAPIs();
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        print("app in resumed");
        // player.value.play();
        break;
      case AppLifecycleState.inactive:
        print("app in inactive");

        break;
      case AppLifecycleState.paused:
        print("app in paused");
        break;
      case AppLifecycleState.detached:
        print("app in detached");
        break;
    }
  }
/*

  void getProfileDetail() {
    var hashMap = {
      "tbl_user_id": userLoginModel!.data.first.tblUserId,
    };
    print(hashMap);
    getMyProfileDetail(hashMap).then((value) {
      if (value.status) {
        MyProfileViewModel model = value.data;
        mUserProfile.value = model.data;
        walletAmount.value = model.data.first.walletAmount;
        userProfile.value = mUserProfile.value.first.profileImage;
      }
    });
  }

  void populerCategory() {
    homePopularCategoryAPI().then((value) {
      if (value.status) {
        HomePopulerTopicsCtegoryModel model = value.data;
        List<populerCDatum> clist = model.data;
        popularCategoryList.value = clist;
        popularCategoryList.forEach((element) {
          if (element.tblCategoryId == isSelectedTopic.value) {
            element.isSelected = true;

            print("righttttttttttttttttttttttt");
          } else {
            element.isSelected = false;
            print("wrommggggggggggggggg");
          }
        });
      } else {
        // showErrorBottomSheet(value.message);
      }
    });
  }

  void checkReviewStaus() {
    var hashMap = {
      "tbl_user_id": userLoginModel!.data.first.tblUserId,
    };
    print(hashMap);
    chechReviewStatus(hashMap).then((value) {
      if (value.status) {
        print("yes");
        ReviewDetailsViewModel model = value.data;
        reviewModel = model;
        submitFeedbackBottomSheet(reviewModel);
      } else {}
    });
  }

  void checkReviewForCall() {
    var hashMap = {
      "tbl_user_id": userLoginModel!.data.first.tblUserId,
    };
    print(hashMap);
    checkCallReviewStatus(hashMap).then((value) {
      if (value.status) {
        print("yes");
        CheckCallReviewListModel model = value.data;
        reviewCallModel = model;
        submitCallFeedbackBottomSheet(reviewCallModel);
      } else {}
    });
  }

  void submitFeedbackBottomSheet(ReviewDetailsViewModel? reviewModel) {
    Get.bottomSheet(
      isScrollControlled: true,
      enableDrag: true,
      Obx(() => SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SACellRoundContainer(
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Image.asset(
                        cancelImg,
                        height: 18,
                        width: 18,
                        color: ColorConstants.APPPRIMARYWHITECOLOR,
                      )),
                  radius: 30,
                  borderWidth: 0,
                  borderWidthColor: Colors.transparent,
                  color: ColorConstants.APPPRIMARYBLACKCOLOR1),
            ),
            Container(
              decoration: const BoxDecoration(
                  color: ColorConstants.APPPRIMARYWHITECOLOR,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    addPadding(10, 0),
                    Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: headingText(
                              title: "How was the Puja?",
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: ColorConstants.APPPRIMARYBLACKCOLOR1),
                        )),
                    addPadding(10, 0),

                    addPadding(0, 5),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SACellRoundContainer(
                          height: 90,
                          width: 90,
                          color: ColorConstants.APPPRIMARYWHITECOLOR,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: ClipOval(
                                child: ImageViewCovered(
                                  photoUrl: reviewModel!.data.first.panditImage,
                                )),
                          ),
                          radius: 60,
                          borderWidth: 2,
                          borderWidthColor: Color(0xffFFA513)),
                    ),
                    addPadding(0, 5),

                    Align(
                      alignment: Alignment.center,
                      child: headingText(
                        title:
                        "Order ID: ${reviewModel!.data.first.bookingNumber.toString()}",
                        color: ColorConstants.APPLIGHTPRIMARYCOLOR,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        align: TextAlign.left,
                      ),
                    ),
                    addPadding(0, 5),

                    Align(
                      alignment: Alignment.center,
                      child: headingText(
                        title: "${reviewModel!.data.first.panditFname}",
                        color: ColorConstants.APPPRIMARYBLACKCOLOR1,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        align: TextAlign.left,
                      ),
                    ),
                    addPadding(5, 0),
                    Align(
                      alignment: Alignment.center,
                      child: headingFullText(
                          title:
                          "Puja name :${reviewModel!.data.first.pujaName}",
                          color: ColorConstants.APPLIGHTPRIMARYCOLOR,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          align: TextAlign.center),
                    ),

                    addPadding(5, 0),
                    RatingBar(
                      ratingWidget: RatingWidget(
                          full: const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          half: const Icon(Icons.star_half),
                          empty: Icon(
                            Icons.star_border,
                            color: Colors.grey.withOpacity(0.3),
                          )),
                      onRatingUpdate: (value) {
                        submitRatingValue.value = value;
                      },
                      initialRating: submitRatingValue.value,
                      itemSize: 36,
                      itemCount: 5,
                    ),
                    addPadding(10, 0),
                    GestureDetector(
                      onTap: () {
                        if (isAnonymous.value) {
                          isAnonymous.value = false;
                        } else {
                          isAnonymous.value = true;
                        }
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            addPadding(0, 33),
                            SACellRoundContainer(
                                color: isAnonymous.value
                                    ? ColorConstants.APPPRIMARYCOLOR
                                    : null,
                                height: 20,
                                width: 20,
                                child: isAnonymous.value
                                    ? Icon(
                                  Icons.check,
                                  size: 17,
                                  color: isAnonymous.value
                                      ? ColorConstants
                                      .APPPRIMARYWHITECOLOR
                                      : null,
                                )
                                    : const SizedBox(),
                                radius: 4,
                                borderWidth: 1,
                                borderWidthColor: Color(0xff858585)),
                            addPadding(0, 10),
                            headingText(
                                title: "Anonymous",
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: ColorConstants.APPLIGHTPRIMARYCOLOR)
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10, top: 10),
                      child: TextFormField(
                        maxLines: 5,
                        maxLength: 200,
                        controller: editSubmitReviewController.value,
                        decoration: InputDecoration(
                          hintText: "Write your Review",
                          hintStyle: GoogleFonts.openSans(
                              fontSize: 15,
                              color: ColorConstants.APPLIGHTPRIMARYCOLOR,
                              fontWeight: FontWeight.w400),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                width: 1.0, color: Color(0xffD9D9D9)),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                width: 1.0, color: Color(0xffD9D9D9)),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 40, horizontal: 10),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                width: 1.0, color: Color(0xffD9D9D9)),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, right: 30, bottom: 10, top: 10),
                      child: CommonButtonUI(
                        text: "SUBMIT",
                        onPressed: () {
                          submitPujaReview();
                        },
                      ),
                    ),

                    // Padding(
                    //   padding: EdgeInsets.only(bottom:MediaQuery.of(context).viewInsets.bottom),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  void submitCallFeedbackBottomSheet(
      CheckCallReviewListModel? reviewCallModel) {
    Get.bottomSheet(
      isScrollControlled: true,
      enableDrag: true,
      Obx(() => SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SACellRoundContainer(
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Image.asset(
                        cancelImg,
                        height: 18,
                        width: 18,
                        color: ColorConstants.APPPRIMARYWHITECOLOR,
                      )),
                  radius: 30,
                  borderWidth: 0,
                  borderWidthColor: Colors.transparent,
                  color: ColorConstants.APPPRIMARYBLACKCOLOR1),
            ),
            Container(
              decoration: const BoxDecoration(
                  color: ColorConstants.APPPRIMARYWHITECOLOR,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    addPadding(10, 0),
                    Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: headingText(
                              title: "How was the Session?",
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: ColorConstants.APPPRIMARYBLACKCOLOR1),
                        )),
                    addPadding(10, 0),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SACellRoundContainer(
                          height: 90,
                          width: 90,
                          color: ColorConstants.APPPRIMARYWHITECOLOR,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: ClipOval(
                                child: ImageViewCovered(
                                  photoUrl:
                                  reviewCallModel!.data.first.panditImage,
                                )),
                          ),
                          radius: 60,
                          borderWidth: 2,
                          borderWidthColor: Color(0xffFFA513)),
                    ),
                    addPadding(0, 5),

                    Align(
                      alignment: Alignment.center,
                      child: headingText(
                        title:
                        "Order ID: ${reviewCallModel!.data.first.bookingNumber} ",
                        color: ColorConstants.APPLIGHTPRIMARYCOLOR,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        align: TextAlign.left,
                      ),
                    ),
                    addPadding(0, 5),

                    Align(
                      alignment: Alignment.center,
                      child: headingText(
                        title: "${reviewCallModel!.data.first.panditFname}",
                        color: ColorConstants.APPPRIMARYBLACKCOLOR1,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        align: TextAlign.left,
                      ),
                    ),

                    addPadding(5, 0),
                    RatingBar(
                      ratingWidget: RatingWidget(
                          full: const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          half: const Icon(Icons.star_half),
                          empty: Icon(
                            Icons.star_border,
                            color: Colors.grey.withOpacity(0.3),
                          )),
                      onRatingUpdate: (value) {
                        submitRatingValue.value = value;
                      },
                      initialRating: submitRatingValue.value,
                      itemSize: 36,
                      itemCount: 5,
                    ),
                    addPadding(10, 0),
                    GestureDetector(
                      onTap: () {
                        if (isAnonymous.value) {
                          isAnonymous.value = false;
                        } else {
                          isAnonymous.value = true;
                        }
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            addPadding(0, 33),
                            SACellRoundContainer(
                                color: isAnonymous.value
                                    ? ColorConstants.APPPRIMARYCOLOR
                                    : null,
                                height: 20,
                                width: 20,
                                child: isAnonymous.value
                                    ? Icon(
                                  Icons.check,
                                  size: 17,
                                  color: isAnonymous.value
                                      ? ColorConstants
                                      .APPPRIMARYWHITECOLOR
                                      : null,
                                )
                                    : const SizedBox(),
                                radius: 4,
                                borderWidth: 1,
                                borderWidthColor: Color(0xff858585)),
                            addPadding(0, 10),
                            headingText(
                                title: "Anonymous",
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: ColorConstants.APPLIGHTPRIMARYCOLOR)
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10, top: 10),
                      child: TextFormField(
                        maxLines: 5,
                        maxLength: 200,
                        controller: editSubmitReviewController.value,
                        decoration: InputDecoration(
                          hintText: "Write your Review",
                          hintStyle: GoogleFonts.openSans(
                              fontSize: 15,
                              color: ColorConstants.APPLIGHTPRIMARYCOLOR,
                              fontWeight: FontWeight.w400),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                width: 1.0, color: Color(0xffD9D9D9)),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                width: 1.0, color: Color(0xffD9D9D9)),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 40, horizontal: 10),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                width: 1.0, color: Color(0xffD9D9D9)),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, right: 30, bottom: 10, top: 10),
                      child: CommonButtonUI(
                        text: "SUBMIT",
                        onPressed: () {
                          submitCallReview(reviewCallModel);
                        },
                      ),
                    ),

                    // Padding(
                    //   padding: EdgeInsets.only(bottom:MediaQuery.of(context).viewInsets.bottom),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  void submitPujaReview() {
    var hashMap = {
      "tbl_user_id": userLoginModel!.data.first.tblUserId,
      "review_type": "puja",
      "rating": submitRatingValue.value.toInt().toString(),
      "reviews": editSubmitReviewController.value.text.isNotEmpty
          ? editSubmitReviewController.value.text.trim().toString()
          : " ",
      "anonymous": isAnonymous.value ? "yes" : "no",
      "booking_number": reviewModel!.data.first.bookingNumber,
    };
    print(hashMap);
    addReviewStatus(hashMap).then((value) {
      if (value.status) {
        Get.back();
        checkReviewStaus();
        isAnonymous.value = false;
        editSubmitReviewController.value.clear();
        toastMessage(value.message);
      } else {
        showErrorBottomSheet(value.message);
      }
    });
  }

  void searchYourPujaAPIs(String string) {
    var hashMap = {
      "tbl_user_id": userLoginModel!.data.first.tblUserId,
      "keywords": string,
      "pagesize": "30",
      "pagenumber": "1",
    };
    print(hashMap.toString() + "asggsgsasa");
    searchYourPujasAPI(hashMap).then((value) {
      if (value.status) {
        arr.clear();
        searchModelList.clear();
        searchModelList.refresh();
        SearchPujasModel model = value.data;
        List<SRDatum> list = model.data;
        isPageNationProgress.value = false;
        final ids = list.map((e) => e.pujaName).toSet();
        list.retainWhere((x) => ids.remove(x.pujaName));
        arr = list;
        searchModelList.addAll(arr);
        isVisibilitySearchBarUI.value = true;
      } else {
        isPageNationProgress.value = false;
        isVisibilitySearchBarUI.value = false;
      }
    });
  }

  void submitCallReview(CheckCallReviewListModel reviewCallModel) {
    var hashMap = {
      "tbl_user_id": userLoginModel!.data.first.tblUserId,
      "review_type": "call",
      "rating": submitRatingValue.value.toInt().toString(),
      "reviews": editSubmitReviewController.value.text.isNotEmpty
          ? editSubmitReviewController.value.text.trim().toString()
          : " ",
      "anonymous": isAnonymous.value ? "yes" : "no",
      "booking_number": reviewCallModel!.data.first.bookingNumber,
    };
    print(hashMap.toString());
    addCallReview(hashMap).then((value) {
      if (value.status) {
        Get.back();
        checkReviewForCall();
        isAnonymous.value = false;
        editSubmitReviewController.value.clear();
        toastMessage(value.message);
      } else {
        showErrorBottomSheet(value.message);
      }
    });
  }

  notificationOfNumbersAPIs() {
    noOfNoticationAPI(
        {"tbl_user_id": userLoginModel!.data.first.tblUserId.toString()})
        .then((value) {
      if (value.status) {
        noOfNotificationValue.value = value.data["total_count"];
        print("object" + noOfNotificationValue.value);
      } else {
        noOfNotificationValue.value = "0";
        showErrorBottomSheet(value.message.toString());
      }
      //notificationList();
    });
  }

*/



}



class DashBoardBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<DashBoardController>(() => DashBoardController());
    Get.put<HomeController>(HomeController());
  }
}