
import 'package:flutter/material.dart';
import '../constands/colors.dart';

class SABackButton extends StatelessWidget {
 final Function() onPressed;
 Color color=Colors.white;
   SABackButton({Key? key,required this.onPressed,required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:15.0),
      child: GestureDetector(
        onTap: onPressed,
        child:  SizedBox(
          height: 40,
          child: Icon(Icons.arrow_back,color:color,),
        ),
      ),
    );
  }
}
