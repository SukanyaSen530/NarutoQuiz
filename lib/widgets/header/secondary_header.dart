import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class SecondaryHeader extends StatelessWidget {
  const SecondaryHeader(
      {super.key,
      required this.headerText,
      this.headerTextSize = 18,
      this.headerTextColor = Colors.black});

  final String headerText;
  final double headerTextSize;
  final Color headerTextColor;

  @override
  Widget build(BuildContext context) {
    return Text(headerText,
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
            color: headerTextColor,
            fontSize: headerTextSize,
            fontWeight: FontWeight.w600));
  }
}
