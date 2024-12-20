import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  // ignore: non_constant_identifier_names
  static ThemeData LightthemeData(BuildContext context) => ThemeData(
   // brightness: Brightness.light,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch:
              Colors.blue, // Base swatch (replace with an existing swatch)
        ).copyWith(
          primary: darkBluishColor, // Replace with your custom color
          secondary: lightBluishColor, // Secondary color for buttons, etc.
        ),
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        canvasColor: creamColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: lightBluishColor, // Set button background color
          ),
        ),
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 40, // Font size
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        //brightness: Brightness.dark,
         colorScheme: ColorScheme.fromSwatch(
          primarySwatch:
              Colors.blue, // Base swatch (replace with an existing swatch)
        ).copyWith(
          primary: Colors.white, // Replace with your custom color
          secondary:lightBluishColor, // Secondary color for buttons, etc.
        ),
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.black,
        canvasColor: darkcreamColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: lightBluishColor, // Set button background color
          ),
        ),
        appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 40, // Font size
            fontWeight: FontWeight.bold,
          ),
        ),

      );

//colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkcreamColor = Vx.gray900;
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;
}
