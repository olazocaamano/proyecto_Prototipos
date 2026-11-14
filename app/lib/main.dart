// Punto de entrada de la aplicacion

// Este archivo es el punto donde Flutter inicia el sistema

import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'core/theme/theme_controller.dart';
import 'screens/login/login_screen.dart';

void main() async {
  // Prepara Flutter antes de cargar las preferencias.
  WidgetsFlutterBinding.ensureInitialized();

  // Crea el controlador del tema.
  final themeController = ThemeController();

  // Recupera la apariencia guardada en el dispositivo.
  await themeController.loadThemePreference();

  // Inicia la aplicacion.
  runApp(MyApp(themeController: themeController));
}

class MyApp extends StatelessWidget {
  final ThemeController themeController;

  const MyApp({
    super.key,
    required this.themeController,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeControllerScope(
      controller: themeController,
      child: AnimatedBuilder(
        animation: themeController,
        builder: (context, child) {
          return MaterialApp(
            // Nombre de la aplicacion
            title: 'Sistema Inteligente de Apoyo Docente',
            debugShowCheckedModeBanner: false,

            // Tema general
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeController.themeMode,

            // Pantalla inicial
            home: const LoginScreen(),
          );
        },
      ),
    );
  }
}
