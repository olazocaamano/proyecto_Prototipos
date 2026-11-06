// Punto de entrada de la aplicacion
// Este archivo es el punto donde Flutter inicia el sistema

import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'screens/login/login_screen.dart';

void main() {
  // Inicia la aplicacion
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Nombre de la aplicacion
      title: 'Sistema Inteligente de Apoyo Docente',
      debugShowCheckedModeBanner: false,

      // tema general
      theme: AppTheme.lightTheme,

      // Pantalla inicial
      home: const LoginScreen(),
    );
  }
}
