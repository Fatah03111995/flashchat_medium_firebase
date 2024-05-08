import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle get general => GoogleFonts.poppins(
      fontWeight: FontWeight.normal, fontSize: 18, fontStyle: FontStyle.normal);

  static TextStyle get s => general.copyWith(fontSize: 10);
  static TextStyle get sBold => s.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get sm => general.copyWith(fontSize: 15);
  static TextStyle get smBold => sm.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get m => general.copyWith(fontSize: 20);
  static TextStyle get mBold => m.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get ml => general.copyWith(fontSize: 30);
  static TextStyle get mlBold => ml.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get l => general.copyWith(fontSize: 40);
  static TextStyle get lBold => l.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get xl => general.copyWith(fontSize: 60);
  static TextStyle get xlBold => xl.copyWith(fontWeight: FontWeight.bold);

  static TextStyle get button => smBold.copyWith(color: Colors.white);

  static TextStyle get formHint => sm.copyWith(
        color: Colors.grey.shade700.withOpacity(0.8),
      );
  static TextStyle get formErr => sBold.copyWith(color: Colors.red);
  static TextStyle get formLabel => m.copyWith(color: Colors.blue);
  static TextStyle get formVal => sm.copyWith(color: Colors.blue);
}
