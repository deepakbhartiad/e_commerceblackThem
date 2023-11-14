import 'package:e_commerce/App/Modules/Dasboard/Controller/CartPageController.dart';
import 'package:e_commerce/App/Shared/constands/colors.dart';
import 'package:e_commerce/App/Shared/sawidget/ImageView.dart';
import 'package:e_commerce/App/Shared/sawidget/cell_container.dart';
import 'package:e_commerce/App/Shared/sawidget/textview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends GetView<CartPageController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView.builder(
              padding: EdgeInsets.only(bottom: 40),
              itemCount: controller.BCImg.length,
              physics: ScrollPhysics(),
              itemBuilder: (context, index) {
                var img = controller.BCImg[index];
                return   ProductCardUI(img);
              }),
          SACellRoundContainer(
            height: 50,
            width: double.infinity,
            color: ColorConstants.APPPRIMARYLIGHTBLACKCOLOR,
            radius: 10,
            borderWidth: 0,
            borderWidthColor: Colors.transparent,
            child: Row(
              children: [
                Expanded(
                    flex: 5,
                    child: Center(
                        child: headingText(
                            title: "Go to checkout",
                            fontWeight: FontWeight.bold,color: ColorConstants.APPPRIMARYWHITECOLOR))),
                Expanded(
                    child: Center(child: Icon(Icons.arrow_right_alt_outlined,color: ColorConstants.APPPRIMARYWHITECOLOR))),
                Expanded(
                    flex: 2,
                    child: Center(
                      child: headingShortLongText(
                          title: "\u{20B9}670",
                          color: ColorConstants.APPPRIMARYWHITECOLOR,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    ))
              ],
            ),
          ).paddingAll(10)
        ],
      ),
    );
  }

  ProductCardUI(img){
    return Obx(
      ()=> Container(
        margin: EdgeInsets.all(5),
        height: 140,
        child: Row(children: [
          Expanded(child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ImageViewFill(
              photoUrl: img.toString(),
            ),
          )),

          addPadding(0, 5),
          Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headingText(title: "Dennis Lingo",fontWeight: FontWeight.bold,color: ColorConstants.APPPRIMARYLIGHTBLACKCOLOR),
                    addPadding(2, 0),
                    headingShortLongText(title: "Slim Fit Lycra Casual Shirt For Man  ",
                        fontWeight: FontWeight.w400,color: ColorConstants.APPPRIMARYLIGHTBLACKCOLOR,fontSize: 12),
                    addPadding(3, 0),
                    RichText(text: TextSpan(
                        children: [
                          TextSpan(text: '23% off ', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green,fontSize: 17,)),
                          TextSpan(
                            text:
                            '  \u{20B9}145',
                            style: TextStyle(
                                fontSize: 16,
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey),
                          ),
                          TextSpan(text: '  \u{20B9}365', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,
                            fontSize: 17,)),
                        ]
                    )),
                    addPadding(2, 0),
                    headingRichText(FirstTitle: "Size:", SecondTitle: " M"),

                    addPadding(3, 0),
                    headingRichText(FirstTitle: "Colour:", SecondTitle: " Black"),
                    addPadding(3, 0),
                    SACellRoundContainer(
                      height: 30,
                        color: Colors.transparent,
                        width: 140,
                        radius:12, borderWidth: 1,
                        borderWidthColor: ColorConstants.APPPRIMARYLIGHTGREYCOLOR,
                      child: Row(
                        children: [
                          Expanded(
                              child:
                              controller.currentItem.value ==1?GestureDetector(
                                onTap: (){
                                 // controller.minesItem();
                                },
                                child: Center(
                                  child: Icon(Icons.delete_outline_outlined),
                                ),
                              ):
                              GestureDetector(
                                onTap: (){
                                  controller.minesItem();
                                },
                                child: Center(
                            child: Icon(Icons.remove),
                          ),
                              )),
                          Expanded(child: Container(
                            decoration: BoxDecoration(
                              color: ColorConstants.APPPRIMARYLIGHTGREYCOLOR.withOpacity(0.1),
                              border: Border.symmetric(horizontal: BorderSide.none,
                                vertical: BorderSide(
                                  color: ColorConstants.APPPRIMARYLIGHTGREYCOLOR,
                                  width: 1,
                                ),
                              )
                            ),
                            child: Center(child: headingText(title: controller.currentItem.value.toString(),
                            fontWeight: FontWeight.w600),),
                          )),
                          Expanded(child: GestureDetector(
                            onTap: (){
                              controller.plushItem();
                            },
                            child: Center(
                              child: Icon(Icons.add),
                            ),
                          )),
                        ],
                      ),
                    )

                  ],
              ))
        ],),
      ),
    );
  }

}
