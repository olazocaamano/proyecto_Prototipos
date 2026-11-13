// Paleta de colores 
// Este archivo contiene los colores que se usan en toda la aplicacion,
// estan en un mismo archivo para que sea mas facil cambiarlo si quieres waaza

import 'package:flutter/material.dart';

class AppColors {
  // Modo claro

  // Color principal
  // Se utiliza para los elementos importantes como botones principales, acciones destacadas etc etc
  static const Color primary = Color(0xFF1E4D8F);

  // Color oscuro
  // Se utilizará para encabezados, elementos de navegación y partes con contraste
  static const Color dark = Color (0xFF12305A);

  // Fondo general
  static const Color background = Color(0xFFF5F7FA);

  // Para superficie
  // Se usa en tarjetas, formularios y cosas que necesitan diferencia del fondo
  static const Color surface = Color(0xFFCCE2FF);

  // Titulos
  static const Color textPrimary = Color(0xFF1F2937);

  // Subtitulos
  static const Color textSecondary = Color(0xFF6B7280);

  // Bordes
  // Para campos de texto, tarjetas
  static const Color border = Color(0xFFD9DEE7);

  // Error
  static const Color error = Color(0xFFD32F2F);

  // Estado de exito
  // Para mensajes despues de realizar una accion como registrarse
  static const Color success = Color(0xFF2E7D32);



  // modo oscuro

  // Color principal
  static const Color darkPrimary = Color(0xFF8DB7F0);

  // Color de encabezados y navegación
  static const Color darkAccent = Color(0xFFB5D1F5);

  // Fondo general
  static const Color darkBackground = Color(0xFF121A27);

  // Superficies: tarjetas y formularios
  static const Color darkSurface = Color(0xFF202C3D);

  // Textos
  static const Color darkTextPrimary = Color(0xFFF3F4F6);
  static const Color darkTextSecondary = Color(0xFFB8C3D1);

  // Bordes
  static const Color darkBorder = Color(0xFF37465A);

  // Estados
  static const Color darkError = Color(0xFFFF6B6B);
  static const Color darkSuccess = Color(0xFF66BB6A);

}