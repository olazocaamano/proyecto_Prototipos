
import 'package:flutter/material.dart';

import 'theme_controller.dart';

// Selector para cambiar la apariencia general del sistema.

class AppearanceSelector extends StatelessWidget {
  const AppearanceSelector({super.key});

  @override
  Widget build(BuildContext context) {
    // Recuperamos el controlador del tema.
    final themeController = ThemeControllerScope.of(context);

    return ListTile(
      // Nombre de la configuración.
      title: const Text('Apariencia'),

      // Descripción de la configuración.
      subtitle: const Text('Selecciona el tema de la aplicación'),

      // Opciones disponibles.
      trailing: DropdownButton<ThemeMode>(
        value: themeController.themeMode,
        onChanged: (ThemeMode? mode) {
          if (mode != null) {
            themeController.setThemeMode(mode);
          }
        },
        items: const [
          DropdownMenuItem(
            value: ThemeMode.light,
            child: Text('Claro'),
          ),
          DropdownMenuItem(
            value: ThemeMode.dark,
            child: Text('Oscuro'),
          ),
          DropdownMenuItem(
            value: ThemeMode.system,
            child: Text('Automático'),
          ),
        ],
      ),
    );
  }
}
