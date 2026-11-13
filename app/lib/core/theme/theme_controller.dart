import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Controlador encargado de administrar el tema visual del sistema.

class ThemeController extends ChangeNotifier {
  // Tema seleccionado actualmente.
  ThemeMode _themeMode = ThemeMode.system;

  // Permite consultar el tema seleccionado.
  ThemeMode get themeMode => _themeMode;

  // Recupera la preferencia de apariencia guardada en el dispositivo.
  Future<void> loadThemePreference() async {
    final preferences = await SharedPreferences.getInstance();

    final savedTheme = preferences.getString('themeMode');

    // Identificamos el tema que había seleccionado el docente.
    switch (savedTheme) {
      case 'light':
        _themeMode = ThemeMode.light;
        break;

      case 'dark':
        _themeMode = ThemeMode.dark;
        break;

      default:
        _themeMode = ThemeMode.system;
    }

    notifyListeners();
  }

  // Cambia el tema y guarda la selección en el dispositivo.
  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;

    notifyListeners();

    final preferences = await SharedPreferences.getInstance();

    await preferences.setString('themeMode', mode.name);
  }
}
// Permite acceder al controlador desde cualquier pantalla.
class ThemeControllerScope extends InheritedNotifier<ThemeController> {
  const ThemeControllerScope({
    super.key,
    required ThemeController controller,
    required super.child,
  }) : super(notifier: controller);

  // Recupera el controlador desde el contexto de una pantalla.
  static ThemeController of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<ThemeControllerScope>();

    assert(scope != null, 'No se encontró ThemeControllerScope');

    return scope!.notifier!;
  }
}