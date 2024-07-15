import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModifiedText extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? size;

  const ModifiedText({super.key, this.text, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: GoogleFonts.breeSerif(
        color: color ?? Colors.black, // Provide a default color if null
        fontSize: size ?? 14.0, // Provide a default font size if null
      ),
    );
  }
}
