import 'dart:async';

import 'package:e_commerce/App/Shared/sawidget/textview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constands/colors.dart';

class SACarousel extends StatefulWidget {
  final double width;
  final double height;
  final List<Widget> list;
  final Color color;
  const SACarousel(
      {Key? key, required this.width, required this.height, required this.list, this.color=Colors.white})
      : super(key: key);

  @override
  _SACarouselState createState() => _SACarouselState();
}

class _SACarouselState extends State<SACarousel> {
  PageController _controller = PageController();
  Timer? _timer;
  int _counter = 0;
  double _opacity = 1;
  int pageNumber = 0;
  bool flag = false;

  @override
  void dispose() {
    if (_timer != null) _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: Duration(milliseconds: 50),
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
              controller: _controller,
              onPageChanged: (page) {
                setState(() {
                  _counter = page;
                });
              },
              itemBuilder: (context, index) {
                return widget.list.elementAt(index);
              },
              itemCount: widget.list.length,
            ),
            _createIndicator()
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {

      _controller.animateToPage(pageNumber,
          duration: const Duration(milliseconds: 500), curve: Curves.linear);

      if (pageNumber == widget.list.length-1) {
        flag = true;
      } else if(pageNumber==0){
        flag = false;
      }

      if (flag) {
        pageNumber -= 1;
      } else {
        pageNumber += 1;
      }
    });
  }

  Widget _createIndicator() {
    List<Widget> list = [];
    widget.list.asMap().forEach((index, element) {
      double radius = index == _counter ? 8 : 6;
      list.add(Container(
        margin: const EdgeInsets.all(4),
        width: radius,
        height: radius,
        decoration: BoxDecoration(
            color: widget.color, shape: BoxShape.circle),
      ));
    });

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: list,
    );
  }
}
showErrorBottomSheet(String title) {
  Get.bottomSheet(Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(5)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              addPadding(0, 10),
              Row(
                children: [
                  addPadding(20, 0),
                  const SizedBox(
                      width: 30,
                      child: Icon(
                        Icons.error,
                        color: Colors.white,
                        size: 25,
                      )),
                  addPadding(10, 0),
                  Expanded(
                      child: headingFullText(
                          title: "Oh! $title",
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.white,
                          align: TextAlign.start)),
                  addPadding(50, 0),
                ],
              ),
              addPadding(0, 10),
            ],
          ),
        ),
      ],
    ),
  ));
}
