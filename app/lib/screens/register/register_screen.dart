// Pantalla del registro
// es el formulario para que cree su cuenta

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../core/api_config.dart';

// Resultado de la llamada al backend.
// Permite que la pantalla decida que mostrar sin depender de un BuildContext.
class RegistroResultado {
  const RegistroResultado.exito(this.mensaje) : ok = true;
  const RegistroResultado.error(this.mensaje) : ok = false;

  final bool ok;
  final String mensaje;
}

Future<RegistroResultado> registrarDocente(
  String username,
  String email,
  String password,
  String firstName,
  String lastName,
) async {
  final url = Uri.parse('${ApiConfig.baseUrl}/api/auth/register.php');

  try {
    final response = await http
        .post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'username': username.trim(),
            'email': email.trim(),
            'password': password,
            'first_name': firstName.trim(),
            'last_name': lastName.trim(),
          }),
        )
        .timeout(ApiConfig.timeout);

    // El backend devuelve JSON incluso en los errores, pero si algo falla
    // (por ejemplo un 500 en HTML) no reventamos: lo reportamos claro.
    Map<String, dynamic>? decoded;
    try {
      decoded = jsonDecode(response.body) as Map<String, dynamic>;
    } catch (_) {
      decoded = null;
    }

    final mensaje =
        decoded?['message']?.toString() ??
        'Respuesta inesperada del servidor (HTTP ${response.statusCode}).';

    final exitoso =
        (response.statusCode == 200 || response.statusCode == 201) &&
        decoded?['status'] == 'success';

    return exitoso
        ? RegistroResultado.exito(mensaje)
        : RegistroResultado.error(mensaje);
  } on TimeoutException {
    debugPrint('>>> Timeout al conectar con $url <<<');
    return const RegistroResultado.error(
      'El servidor tardó demasiado en responder. ¿Está corriendo el backend?',
    );
  } on SocketException catch (e) {
    debugPrint('>>> Error tecnico exacto: $e <<<');
    final authority = Uri.parse(ApiConfig.baseUrl).authority;
    return RegistroResultado.error(
      'No hay conexión con el servidor en ${ApiConfig.baseUrl}.\n'
      'Abre una terminal en la carpeta backend y ejecuta: php -S $authority',
    );
  } on http.ClientException catch (e) {
    debugPrint('>>> Error tecnico exacto: $e <<<');
    return RegistroResultado.error('No se pudo completar la petición: ${e.message}');
  } catch (e) {
    debugPrint('>>> Error tecnico exacto: $e <<<');
    return RegistroResultado.error('Error inesperado al registrar: $e');
  }
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // 1. Declarar los controladores para cada campo
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidosController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // Evita que se envíen dos registros con doble clic y muestra el spinner
  bool _enviando = false;

  // 2. Liberar memoria cuando la pantalla se cierre
  @override
  void dispose() {
    _nombreController.dispose();
    _apellidosController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _mostrarMensaje(String mensaje, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensaje), backgroundColor: color),
    );
  }

  Future<void> _crearCuenta() async {
    if (_enviando) return;

    // Validación para evitar enviar datos vacíos
    if (_nombreController.text.isEmpty ||
        _apellidosController.text.isEmpty ||
        _usernameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      _mostrarMensaje('Por favor llena todos los campos', Colors.orange);
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      _mostrarMensaje('Las contraseñas no coinciden', Colors.orange);
      return;
    }

    if (_passwordController.text.length < 8) {
      _mostrarMensaje(
        'La contraseña debe tener al menos 8 caracteres',
        Colors.orange,
      );
      return;
    }

    setState(() => _enviando = true);

    final resultado = await registrarDocente(
      _usernameController.text,
      _emailController.text,
      _passwordController.text,
      _nombreController.text,
      _apellidosController.text,
    );

    // La pantalla pudo cerrarse mientras esperábamos la respuesta
    if (!mounted) return;

    setState(() => _enviando = false);

    _mostrarMensaje(
      resultado.mensaje,
      resultado.ok ? Colors.green : Colors.red,
    );

    if (resultado.ok) {
      _passwordController.clear();
      _confirmPasswordController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'Sistema Inteligente',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Crear cuenta',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 32),

                  Text('Nombre', style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _nombreController, // Asignar controlador
                    decoration: const InputDecoration(
                      hintText: 'Ingrese su nombre',
                    ),
                  ),
                  const SizedBox(height: 18),

                  Text(
                    'Apellidos',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _apellidosController, // Asignar controlador
                    decoration: const InputDecoration(
                      hintText: 'Ingrese sus apellidos',
                    ),
                  ),
                  const SizedBox(height: 18),

                  Text('Usuario', style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _usernameController, // Asignar controlador
                    decoration: const InputDecoration(
                      hintText: 'Ingrese un nombre de usuario',
                    ),
                  ),
                  const SizedBox(height: 18),

                  Text(
                    'Correo electrónico',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _emailController, // Asignar controlador
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'ejemplo@correo.com',
                    ),
                  ),
                  const SizedBox(height: 18),

                  Text(
                    'Contraseña',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _passwordController, // Asignar controlador
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Cree una contraseña',
                    ),
                  ),
                  const SizedBox(height: 8),

                  Text(
                    'Confirme su contraseña',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller:
                        _confirmPasswordController, // Asignar controlador
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Repita su contraseña',
                    ),
                  ),
                  const SizedBox(height: 28),

                  SizedBox(
                    height: 52,
                    child: ElevatedButton(
                      onPressed: _enviando ? null : _crearCuenta,
                      child: _enviando
                          ? const SizedBox(
                              width: 22,
                              height: 22,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text('Crear cuenta'),
                    ),
                  ),
                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '¿Ya tienes cuenta?',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextButton(
                        onPressed: () {
                          // Navegación futura a la pantalla de Login
                        },
                        child: const Text('Iniciar sesión'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
