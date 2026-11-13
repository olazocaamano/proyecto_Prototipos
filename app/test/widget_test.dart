// Pruebas basicas

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_platform_interface.dart';

import 'package:app/main.dart';
import 'package:app/core/theme/theme_controller.dart';
import 'package:app/core/theme/appearance_selector.dart';

void main() {
  // Prueba de inicio de la aplicación.
  testWidgets('La aplicación inicia correctamente', (
    WidgetTester tester,
  ) async {
    final themeController = ThemeController();

    await tester.pumpWidget(MyApp(themeController: themeController));

    expect(find.byType(MaterialApp), findsOneWidget);
  });

  // Prueba del selector de apariencia.
  testWidgets('El selector muestra las tres opciones de apariencia', (
    WidgetTester tester,
  ) async {
    SharedPreferences.setMockInitialValues({});

    final themeController = ThemeController();

    await tester.pumpWidget(
      MaterialApp(
        home: ThemeControllerScope(
          controller: themeController,
          child: const Scaffold(body: AppearanceSelector()),
        ),
      ),
    );

    // Abrimos las opciones de apariencia.
    await tester.tap(find.byType(DropdownButton<ThemeMode>));

    await tester.pumpAndSettle();

    // Comprobamos las tres opciones.
    expect(find.text('Claro'), findsWidgets);
    expect(find.text('Oscuro'), findsWidgets);
    expect(find.text('Automático'), findsWidgets);
  });


  // Prueba del cambio de apariencia.
  testWidgets(
    'El tema cambia cuando se selecciona otra apariencia',
    (WidgetTester tester) async {
      SharedPreferences.setMockInitialValues({});

      final themeController = ThemeController();

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeController.themeMode,
          home: ThemeControllerScope(
            controller: themeController,
            child: const Scaffold(
              body: AppearanceSelector(),
            ),
          ),
        ),
      );

      // Comprobamos que inicialmente utiliza el tema automático.
      expect(
        themeController.themeMode,
        ThemeMode.system,
      );

      // Abrimos el selector.
      await tester.tap(
        find.byType(DropdownButton<ThemeMode>),
      );

      await tester.pumpAndSettle();

      // Seleccionamos el tema oscuro.
      await tester.tap(find.text('Oscuro').last);

      await tester.pumpAndSettle();

      // Comprobamos que el controlador cambió al tema oscuro.
      expect(
        themeController.themeMode,
        ThemeMode.dark,
      );

      // Comprobamos que se guardó la preferencia.
      final preferences = await SharedPreferences.getInstance();

      expect(
        preferences.getString('themeMode'),
        'dark',
      );
    },
  );

  // Prueba de recuperación de la apariencia guardada.
  test(
    'La aplicación recupera el tema seleccionado',
    () async {
      // Simulamos que el docente había seleccionado el tema oscuro.
      SharedPreferences.setMockInitialValues({
        'themeMode': 'dark',
      });

      final themeController = ThemeController();

      // Recuperamos la preferencia guardada.
      await themeController.loadThemePreference();

      // Comprobamos que se recuperó correctamente.
      expect(
        themeController.themeMode,
        ThemeMode.dark,
      );
    },
  );

}
