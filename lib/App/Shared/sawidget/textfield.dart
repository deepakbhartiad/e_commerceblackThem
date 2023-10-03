

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../app/shared/constands/colors.dart';


class SAIconTextField extends StatelessWidget {

  final String hintText;
  TextEditingController controller;
    SAIconTextField({Key? key,required this.hintText,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TextField(
      textCapitalization: TextCapitalization.sentences,
        controller: controller,
      cursorColor: Colors.white,
      style: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500),
      textAlign: TextAlign.left,
      decoration: InputDecoration(
        border: InputBorder.none,
  /*      enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffD9D9D9)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffD9D9D9)),
        ),*/
        contentPadding:
        const EdgeInsets.fromLTRB(20.0, 15.0, 30.0, 10.0),
        prefixIcon: const Padding(
          padding: EdgeInsets.only(right: 10.0),
          child:
          Icon(
            Icons.email_outlined,
            color: Colors.white,
            size: 20,
          ),
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}




class SATextField extends StatelessWidget {

  final String hintText;
  final TextEditingController controller;
  const SATextField({Key? key,required this.hintText,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        enabled: true,
        controller: controller,
        textCapitalization: TextCapitalization.sentences,
        textInputAction: TextInputAction.next,
        style: GoogleFonts.inter(
            color: ColorConstants.APPLIGHTPRIMARYCOLOR,
            fontSize: 15,
            fontWeight: FontWeight.w600),
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffD9D9D9)),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffD9D9D9)),
          ),

          hintText: hintText,
          hintStyle: GoogleFonts.inter(
              color: ColorConstants.APPLIGHTPRIMARYCOLOR,
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}



class SANumberTextField extends StatelessWidget {

  final String hintText;
  final TextEditingController controller;
 const SANumberTextField({Key? key,required this.hintText,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      inputFormatters: [
        LengthLimitingTextInputFormatter(10)
      ],

      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      style: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500),
      textAlign: TextAlign.left,
      decoration: InputDecoration(
        border: InputBorder.none,
    /*    enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffD9D9D9)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffD9D9D9)),
        ),*/
        contentPadding:
        const EdgeInsets.fromLTRB(10.0, 15.0, 30.0, 10.0),
        hintText: hintText,
        prefixIcon: const Padding(
          padding: EdgeInsets.only(right: 10.0),
          child:
          Icon(
            Icons.call,
            color: Colors.white,
            size: 20,
          ),
        ),
        hintStyle: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}





class UnderlineTextField extends StatelessWidget {
  final TextEditingController controller;
  const  UnderlineTextField({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      style: GoogleFonts.inter(
          color: const Color(0xff434343),
          fontSize: 14,
          fontWeight: FontWeight.w500),
      controller: controller,
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.6)),
            //  when the TextFormField in unfocused
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.6)),
            //  when the TextFormField in focused
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.6)),
          )),
    );
  }
}


class UnderlinePrefixIconTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function() onTap;
  final Function() onTap1;
  const UnderlinePrefixIconTextField({Key? key,required this.controller,required this.onTap,required this.onTap1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.inter(
          color: const Color(0xff434343),
          fontSize: 14,
          fontWeight: FontWeight.w500),
      controller:  controller,
      onTap:onTap,
      decoration: InputDecoration(
          suffixIcon: Padding(
            padding: const EdgeInsets.only(
                bottom: 8.0, left: 8),
            child: IconButton(
              onPressed: onTap1,
              icon: const Icon(
                Icons.calendar_today_outlined,
                size: 16,
              ),
            ),
          ),
          hintStyle: GoogleFonts.inter(
              color: const Color(0xff434343),
              fontSize: 14,
              fontWeight: FontWeight.w500),
          hintText: "DOB",
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.6)),
            //  when the TextFormField in unfocused
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.6)),
            //  when the TextFormField in focused
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.6)),
          )),
    );
  }
}
