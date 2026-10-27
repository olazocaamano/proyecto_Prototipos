// Configuracion centralizada del backend.
// Cambia aqui la URL en lugar de repetirla en cada pantalla.

class ApiConfig {
  ApiConfig._();

  // Windows desktop / navegador: el backend corre en la misma PC.
  // Emulador Android: 'http://10.0.2.2:8000'
  // Telefono fisico: 'http://IP-LAN-DE-TU-PC:8000'
  //
  // Tambien se puede sobreescribir al ejecutar sin tocar el codigo:
  //   flutter run -d windows --dart-define=API_BASE_URL=http://10.0.2.2:8000
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://127.0.0.1:8000',
  );

  // Si el servidor no responde en este tiempo, mostramos error en vez de
  // dejar el boton colgado para siempre.
  static const Duration timeout = Duration(seconds: 10);
}
