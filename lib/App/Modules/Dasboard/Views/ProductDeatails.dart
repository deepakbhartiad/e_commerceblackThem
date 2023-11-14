import 'package:e_commerce/App/Shared/constands/colors.dart';
import 'package:e_commerce/App/Shared/sawidget/cell_container.dart';
import 'package:e_commerce/App/Shared/sawidget/textview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

import '../../../Shared/sawidget/CustomPaints.dart';
import '../../../Shared/sawidget/ImageView.dart';
import '../../../Shared/sawidget/LoadingOverlay.dart';
import '../../../Shared/sawidget/SACarsol.dart';
class ProductDetailsView extends StatefulWidget {
  String productUrl;
  String productName;
   ProductDetailsView({super.key, required this.productUrl,required this.productName});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  Widget build(BuildContext context) {
    String text = loremIpsum(words: 15, paragraphs: 1, initWithLorem: true);
    print(text);
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           DKBottomRoundContainer(
             height: 397,
               radius: 25,
               borderWidth: 0,
               borderWidthColor: Colors.transparent,
             child: Stack(
               alignment: Alignment.topCenter,
               // fit: StackFit.expand,
               children: [
                 SafeArea(
                     child: Container(
                       padding: EdgeInsets.symmetric(horizontal: 10),
                       width: double.infinity,
                       height: MediaQuery.of(context).size.height * 0.5,
                       child: ClipRRect(
                         borderRadius: BorderRadius.circular(15),
                         child: ImageViewFill(
                           photoUrl: widget.productUrl,
                         ),
                       ),
                     )
                     //CarouselImageSlider(context,widget.productUrl)
                 ),
                 SafeArea(
                   child: Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 17,vertical: 17),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         GestureDetector(
                           onTap: ()=>Get.back(),
                           child: SACellRoundContainer(
                             height: 35,width: 37,
                             borderWidth: 0,
                             borderWidthColor: Colors.transparent,
                             radius: 8,
                             color: Colors.grey.withOpacity(0.5),
                             child: Icon(Icons.arrow_back,color: Colors.white,),),
                         ),
                         SACellRoundContainer(
                           height: 35,width: 37,
                           borderWidth: 0,
                           borderWidthColor: Colors.transparent,
                           radius: 8,
                           color: Colors.grey.withOpacity(0.5),
                           child: Icon(Icons.shopping_cart_rounded,color: Colors.white,),),            ],
                     ),
                   ),
                 ),
               ],
             ),
           ),
            addPadding(8, 0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      headingShortText(title: "Visit the Store",color: ColorConstants.APPSECONDARYCOLOR,
                          fontSize: 13,fontWeight: FontWeight.w500),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          headingShortText(title: "4.0",fontSize: 13,fontWeight: FontWeight.w500),
                            addPadding(0, 3),
                          RatingBar.builder(
                            // initialRating: astroList[i].rating.toDouble(),
                            minRating: 1,
                            direction: Axis.horizontal,
                            itemSize: 17,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,size: 10,
                              color:Color(
                                  0xffe1b103),
                            ), onRatingUpdate: (double value) {  },

                          ),
                        ],
                      ),
                    ],
                  ),

                  headingFullText(
                      title: "${widget.productName} ($text)",
                      color: ColorConstants.APPPRIMARYBLACKCOLOR,
                      fontSize: 15,fontWeight: FontWeight.w500
                  ),
                  addPadding(5, 0),
                  SACellRoundContainer(
                    height: 30,width: 110,
                      child: ClipRRect(
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(6)),
                        child: CustomPaint(
                          painter: SpecialPricePaint(),
                          child: Center(
                            child:
                            headingLongText(title: "Special price",fontSize: 11,fontWeight: FontWeight.w600,
                                color: ColorConstants.APPSECONDARYCOLOR
                            ).paddingOnly(right: 5),),
                        ),
                      )
                      , radius: 8, borderWidth: 0, borderWidthColor: Colors.transparent,
                      ),


                  addPadding(8, 0),
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
                  addPadding(8, 0),
              // CARD 
             SACellRoundContainer(
           color: ColorConstants.APPPRIMARYBLACKCOLOR.withOpacity(0.1),
             child: ClipRRect(
               borderRadius: BorderRadius.circular(10),
               child: CustomPaint(
                 painter: DetailPaints(),
                 child: Column(
           children: [
                 ListTile(
                   contentPadding: EdgeInsets.zero,
                   leading: CircleAvatar(
                       backgroundColor: ColorConstants.APPSECONDARYCOLOR.withOpacity(0.2),

                       child: Icon(Icons.fire_truck_outlined,color: Colors.white,)),
                   title:  RichText(text: TextSpan(
                       children: [
                         TextSpan(text: 'FREE Delivery ', style: TextStyle(fontWeight: FontWeight.bold,
                           color: Colors.green,fontSize: 14,)),
                         TextSpan(
                           text:
                           '  \u{20B9}45  ',
                           style: TextStyle(
                               fontSize: 15,
                               decoration: TextDecoration.lineThrough,
                               color: Colors.grey),
                         ),
                         TextSpan(text: '  Delivery by 29 Aug Tuesday', style: TextStyle(fontWeight: FontWeight.w600,
                           color: Colors.black.withOpacity(0.7),    fontSize: 14,)),
                       ]
                   )),
                   trailing: Icon(Icons.arrow_forward_ios_rounded,size: 11,color: Colors.grey,),
                 ),

                 ListTile(
                   contentPadding: EdgeInsets.zero,
                   leading: CircleAvatar(
                       backgroundColor: ColorConstants.APPSECONDARYCOLOR.withOpacity(0.2),

                       child: Icon(CupertinoIcons.return_icon,color: Colors.white,)),
                   title:  headingText(title: "10 Days Return Policy",fontSize: 15),
                   trailing: Icon(Icons.arrow_forward_ios_rounded,size: 11,color: Colors.grey,),
                 ),
                 ListTile(
                   contentPadding: EdgeInsets.zero,
                   leading:CircleAvatar(
                     
                     backgroundColor: ColorConstants.APPSECONDARYCOLOR.withOpacity(0.2),
                     child: SACellRoundContainer(
                         height: 18,
                         width: 28,
                         child: Center(child: headingText(title: "\u{20B9}")),
                         radius: 5, borderWidth: 1.5, borderWidthColor: Colors.white),
                   ),
                   title:  headingText(title: "Cash on Delivery Available",fontSize: 15),
                   trailing: Icon(Icons.arrow_forward_ios_rounded,size: 11,color: Colors.grey,),
                 ),
           ],
         ).paddingSymmetric(horizontal: 8),
               ),
             ),
       radius: 10, borderWidth: 0, borderWidthColor: Colors.transparent),
                  
                  addPadding(8, 0),
                  headingText(title: "Product Details",fontWeight: FontWeight.bold),
                  addPadding(15, 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                          children: [
                            headingText(title: "Pattern",color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w500),
                            addPadding(5, 0),
                            headingText(title: "Type",color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w500),
                            addPadding(5, 0),
                            headingText(title: "Fabric",color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w500),
                            addPadding(5, 0),
                            headingText(title: "Color",color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w500),

                          ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          headingText(title: "Printed",color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600),
                          addPadding(5, 0),
                          headingText(title: "Straight",color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600),
                          addPadding(5, 0),
                          headingText(title: "Cotton Blend",color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600),
                          addPadding(5, 0),
                          headingText(title: "Beige, Dark Blue",color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      )

                    ],
                  ),
                  addPadding(8, 0),
                  headingText(title: "About this Item",fontWeight: FontWeight.bold),
                  addPadding(15, 0),
                  headingFullText(title: "${loremIpsum(words: 70, paragraphs: 3, initWithLorem: true)}"),
                  addPadding(8, 0),
                  headingText(title: "Product Description",fontWeight: FontWeight.bold),
                  addPadding(15, 0),
                  SACellRoundContainer(
                    height: 500,
                      width: double.infinity,
                      radius: 20,
                      borderWidth: 1,
                      borderWidthColor: Colors.grey,
                    child: Column(
                      children: [
                        Expanded(
                            child: Container(
                              width:double.infinity,
                         decoration: BoxDecoration(
                             color: ColorConstants.APPSECONDARYCOLOR.withOpacity(0.1),
                           borderRadius: BorderRadius.vertical(top: Radius.circular(19))
                         ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(19)),
                                child: CustomPaint(
                                  // painter: DetailPaints2(),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        headingText(title: "External Design",fontWeight: FontWeight.bold),
                                        addPadding(6, 0),
                                        headingFullText(title: loremIpsum(words: 30, paragraphs: 1, initWithLorem: true))

                                      ],
                                    ),
                                  ),
                                ),
                              ),


                        )),
                        Expanded(
                            flex: 2,
                            child: SizedBox(
                              width: double.infinity,
                              child: ClipRRect(
                                borderRadius: BorderRadius.vertical(bottom: Radius.circular(19),
                                ),
                                child:ImageViewCovered(
                                  photoUrl: widget.productUrl,
                                ),
                              ),
                            )),

                      ],
                    ),
                  ),
                  addPadding(10, 0),
                  SACellRoundContainer(
                    height: 500,
                    width: double.infinity,
                    radius: 20,
                    borderWidth: 1,
                    borderWidthColor: Colors.grey,
                    child: Column(
                      children: [
                        Expanded(
                            child: Container(
                              width:double.infinity,
                              decoration: BoxDecoration(
                                  color: ColorConstants.APPSECONDARYCOLOR.withOpacity(0.1),
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(19))
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(19)),
                                child: CustomPaint(
                                  // painter: DetailPaints2(),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        headingText(title: "Material",fontWeight: FontWeight.bold),
                                        addPadding(6, 0),
                                        headingFullText(title: loremIpsum(words: 30, paragraphs: 1, initWithLorem: true))

                                      ],
                                    ),
                                  ),
                                ),
                              ),


                            )),
                        Expanded(
                            flex: 2,
                            child: SizedBox(
                              width: double.infinity,
                              child: ClipRRect(
                                borderRadius: BorderRadius.vertical(bottom: Radius.circular(19),
                                ),
                                child:ImageViewCovered(
                                  photoUrl: widget.productUrl,
                                ),
                              ),
                            )),

                      ],
                    ),
                  ),
                  addPadding(15, 0),
                  SACellRoundContainer(
                    height: 500,
                    width: double.infinity,
                    radius: 20,
                    borderWidth: 1,
                    borderWidthColor: Colors.grey,
                    child: Column(
                      children: [
                        Expanded(
                            child: Container(
                              width:double.infinity,
                              decoration: BoxDecoration(
                                  color: ColorConstants.APPSECONDARYCOLOR.withOpacity(0.1),
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(19))
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(19)),
                                child: CustomPaint(
                                  // painter: DetailPaints2(),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        headingText(title: "Feature",fontWeight: FontWeight.bold),
                                        addPadding(6, 0),
                                        headingFullText(title: loremIpsum(words: 30, paragraphs: 1, initWithLorem: true))

                                      ],
                                    ),
                                  ),
                                ),
                              ),


                            )),
                        Expanded(
                            flex: 2,
                            child: SizedBox(
                              width: double.infinity,
                              child: ClipRRect(
                                borderRadius: BorderRadius.vertical(bottom: Radius.circular(19),
                                ),
                                child:ImageViewCovered(
                                  photoUrl: widget.productUrl,
                                ),
                              ),
                            )),

                      ],
                    ),
                  ),


                ],
              ),
            )
            




          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 85,
        color: Colors.transparent,
        child: CustomPaint(
         painter: BottomPaint(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Row(
                 mainAxisSize: MainAxisSize.min,
                   children: [
                 Icon(Icons.shopping_cart_rounded,color: Colors.grey,),
                 addPadding(0, 15),
                 headingText(title: "Add to cart",color: Colors.grey,fontWeight: FontWeight.bold)
                   ],
               ),
                SACellRoundContainer(
                  color: Colors.blue,
                    radius: 5,
                    borderWidth: 1,
                    borderWidthColor: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 11,vertical: 6),
                    child: headingText(title: "By Now",fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                )
              ],
          ).marginOnly(top: 25,left: 15,right: 15),
        ),
      ),
    );
  }


  Widget CarouselImageSlider(
      BuildContext context, List bannerUrlLList) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 5.0,vertical: 5),
      child: bannerUrlLList.isEmpty
          ?  PageNationLoaderPage()
          :SACarousel(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.5,
        list:bannerUrlLList.map((e) =>  GestureDetector(
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

    );}



}
