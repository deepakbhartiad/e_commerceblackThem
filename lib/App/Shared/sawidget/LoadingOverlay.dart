
import 'package:flutter/material.dart';
import '../../../app/shared/constands/colors.dart';
import 'cell_container.dart';


class LoadingOverlay extends StatelessWidget {
  bool boolIsLoading;
  LoadingOverlay({Key? key,required this.boolIsLoading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: boolIsLoading,
      child: Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Row(children: <Widget>[
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                  color: ColorConstants.APPPRIMARYLIGHTBLACKCOLOR,
                  borderRadius: BorderRadius.all(Radius.circular(16))
              ),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: CircularProgressIndicator(strokeWidth: 4.5,color: Colors.white,),
              ),
            ),
          ),
          Expanded(child: Container()),
        ],),),
    );
  }
}

class PageNationLoaderPage extends StatelessWidget {
  const PageNationLoaderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: 15,),

          Align(
            alignment: Alignment.topCenter,
            child: SACellShadowContainer(
                height: 38,
                width: 38,
                radius: 50,
                color: ColorConstants.APPPRIMARYWHITECOLOR,
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: CircularProgressIndicator(
                    color: ColorConstants.APPPRIMARYCOLOR,
                    strokeWidth: 3,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

