// Tema general del sistema
// Este archivo como se aplica colores y estilos generales a los componentes de flutter
// elementos como botones, campos de texto, tarjetas, etc etc
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  // Tema principal del tema
  static ThemeData lightTheme = ThemeData(
    //usamos material 3 como base visual de la app
    useMaterial3: true,

    // tipografia general

    fontFamily: 'Verdana',

    //colores

    //color principal del sistema
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
    ),

    //fondo general
    scaffoldBackgroundColor: AppColors.background,

    //color de la superficie
    cardColor: AppColors.surface,


    //Estilos de texto

    textTheme: const TextTheme(
      //titulo principal
      headlineMedium: TextStyle(
        fontFamily: 'Segoe UI',
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),

      // Subtitulos 
      titleLarge: TextStyle(
        fontFamily: 'Segoe UI',
        fontSize: 19,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),

      //texto normal
      bodyLarge: TextStyle(
        fontFamily: 'Verdana',
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
      
      //texto secundario
      bodyMedium: TextStyle(
        fontFamily: 'Verdana',
        fontSize: 14,
        color: AppColors.textSecondary,
      ),
    ),


    //botones principales

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,

        //bordes redondeados
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),

        //espacio interno del boton
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 24,
        ),

        // fuente del boton
        textStyle: const TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 16,
          fontWeight: FontWeight.w600,
        )
      ),
    ),

    //campos de texto

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,

      //bordes normales
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.border,
        ),
      ),

      //border cuando el usuario selecciona el campo
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.primary,
          width: 2,
        ),
      ),

      //border para error
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.error,
        ),
      ),

      //texto de ayuda dentro del campo
      hintStyle: const TextStyle(
        fontFamily: 'Verdana',
        fontSize: 14,
        color: AppColors.textSecondary,
      ),
    ),


    //tarjetas
    cardTheme: CardThemeData(
      color:AppColors.surface,
      elevation: 0,

      //bordes suaves para tarjetas
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(
          color: AppColors.border,
        ),
      ),
    ),
  );
}
