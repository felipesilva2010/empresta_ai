import 'package:flutter/material.dart';

//Guia de estilo do Empresta AI
class TemaemprestaAi {
  static const corSemente = Color(0xFF00447c);

  static const espacoP = 8;
  static const espacoM = 16;
  static const espacoG = 24;

  static ThemeData claro() => _base(Brightness.light);
  static ThemeData escure() => _base(Brightness.dark);

  //Função que recebe um brilho e aplica no thema
  static ThemeData _base(Brightness brilho) {
    final cores = ColorScheme.fromSeed(
      seedColor: corSemente,
      brightness: brilho,
    );

    return ThemeData(
      colorScheme: cores,
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: Size.fromHeight(52),
          textStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(border: OutlineInputBorder()),

      cardTheme: CardThemeData(margin: EdgeInsets.zero),
    );
  }
}
