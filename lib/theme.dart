import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = Color(0xff6C5ECF);
Color secondaryColor = Color(0xff38ABBE);
Color lightTextColor = Color(0xff504F5E);
Color alertColor = Color(0xffED6363);
Color priceColor = Color(0xff2C96F1);
Color bgColor1 = Color(0xff1F1D2B);
Color bgColor2 = Color(0xff2B2937);
Color bgColor3 = Color(0xff242231);
Color bgColor4 = Color(0xffECEDEF);
Color primaryTextColor = Color(0xffF1F0F2);
Color secondaryTextColor = Color(0xff999999);
Color priceTextColor = Color(0xff2C96F1);
Color buttonColor = Color(0xff999999);
Color iconColorPrimary = Colors.white;
Color iconColorSecondary = Colors.black;
double defaultMargin = 20.0;
double heightMargin = 30.0;

TextStyle primaryTextStyle = GoogleFonts.poppins(color: primaryTextColor);

TextStyle secondaryTextStyle = GoogleFonts.poppins(color: secondaryTextColor);

TextStyle priceTextStyle = GoogleFonts.poppins(color: priceTextColor);

TextStyle descTextStyle = GoogleFonts.poppins(color: lightTextColor);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;

ButtonStyle categoriesButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      // side: BorderSide
    ),
  ),
);
