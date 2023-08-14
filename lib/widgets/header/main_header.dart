import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class MainHeader extends StatelessWidget {
  const MainHeader(this.headerText,
      {super.key, this.headerTextColor = const Color.fromRGBO(220, 47, 2, 1)});

  final String headerText;
  final Color headerTextColor;

  @override
  Widget build(BuildContext context) {
    return Text(headerText,
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
            color: headerTextColor, fontSize: 22, fontWeight: FontWeight.w800));
  }
}
