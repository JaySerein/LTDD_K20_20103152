import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AppConstant {
  static TextStyle textAppbar = GoogleFonts.asap(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: Colors.white,
  );
  static TextStyle textNormal = GoogleFonts.asap(
    fontWeight: FontWeight.bold,
  );
  static TextStyle textHeader = GoogleFonts.asap(
    fontWeight: FontWeight.bold,
    fontSize: 35,
    color: Colors.black,
  );
  static TextStyle textHeaderV2 = GoogleFonts.asap(
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle textError = GoogleFonts.asap(
    fontSize: 15,
    color: Colors.red,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
  );
  static TextStyle textSize18 = GoogleFonts.asap(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static TextStyle textLink = GoogleFonts.asap(
    fontSize: 18,
    color: Colors.blue,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
  );
  static TextStyle textButton = GoogleFonts.asap(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static TextStyle textBody = GoogleFonts.asap(
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );
  static TextStyle textBodyFocus = GoogleFonts.asap(
    fontSize: 25,
    color: Colors.blue,
    fontWeight: FontWeight.bold,
  );
  static TextStyle textFill = GoogleFonts.asap(
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle textFillShow = GoogleFonts.asap(
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.normal,
  );
  static TextStyle textWhite = GoogleFonts.asap(
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.normal,
  );
  static TextStyle textWhiteBold = GoogleFonts.asap(
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle textCourse = GoogleFonts.asap(
    fontSize: 15,
    color: Colors.black,
    fontWeight: FontWeight.normal,
  );
  static TextStyle textCourseBold = GoogleFonts.asap(
    fontSize: 15,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static LinearGradient colorGradient = const LinearGradient(colors: [
    Color.fromARGB(255, 90, 231, 247),
    Color.fromARGB(255, 17, 0, 255),
  ]);
  static Color themeColor = Colors.blue;
  static Color backgroundColor = const Color.fromRGBO(238, 238, 238, 1);

  static bool isDate(String date) {
    try {
      var inputFormat = DateFormat('yyyy/dd/MM');
      // ignore: unused_local_variable
      var dates = inputFormat.parseStrict(date);
      return true;
    } catch (e) {
      return false;
    }
  }
}
