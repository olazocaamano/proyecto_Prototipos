import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../core/api_config.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _usuarioController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _ocultarPassword = true;
  bool _iniciandoSesion = false;

  @override
  void dispose() {
    _usuarioController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _mostrarMensaje(String mensaje, {bool error = false}) {
    final colores = Theme.of(context).colorScheme;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        backgroundColor: error ? colores.error : colores.primary,
      ),
    );
  }

  Future<void> _iniciarSesion() async {
    if (!_formKey.currentState!.validate()) return;
    if (_iniciandoSesion) return;

    setState(() {
      _iniciandoSesion = true;
    });

    final url = Uri.parse('${ApiConfig.baseUrl}/api/auth/login.php');

    try {
      final response = await http
          .post(
            url,
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'username': _usuarioController.text.trim(),
              'password': _passwordController.text,
            }),
          )
          .timeout(ApiConfig.timeout);

      Map<String, dynamic>? datos;

      try {
        final resultado = jsonDecode(response.body);

        if (resultado is Map<String, dynamic>) {
          datos = resultado;
        }
      } on FormatException {
        datos = null;
      }

      final correcto =
          response.statusCode == 200 && datos?['status'] == 'success';

      if (!mounted) return;

      if (correcto) {
        final usuario = datos?['usuario'];

        final nombre = usuario is Map
            ? (usuario['first_name']?.toString() ?? '')
            : '';

        _mostrarMensaje('¡Bienvenido${nombre.isNotEmpty ? ', $nombre' : ''}!');

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomeScreen(nombreUsuario: nombre)),
        );
        // conexion con el dashboard futura
      } else {
        _mostrarMensaje(
          datos?['message']?.toString() ??
              'No se pudo interpretar la respuesta del servidor.',
          error: true,
        );
      }
    } on TimeoutException {
      if (!mounted) return;

      _mostrarMensaje('El servidor tardó demasiado en responder.', error: true);
    } on SocketException {
      if (!mounted) return;

      _mostrarMensaje(
        'No se pudo conectar con ${ApiConfig.baseUrl}. '
        'Verifica que el backend esté funcionando.',
        error: true,
      );
    } on http.ClientException {
      if (!mounted) return;

      _mostrarMensaje('No se pudo conectar con el servidor.', error: true);
    } catch (e) {
      debugPrint('Error al iniciar sesión: $e');

      if (!mounted) return;

      _mostrarMensaje('Ocurrió un error inesperado.', error: true);
    } finally {
      if (mounted) {
        setState(() {
          _iniciandoSesion = false;
        });
      }
    }
  }

  void _abrirRegistro() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const RegisterScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Sistema Inteligente',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 8),

                    Text(
                      'Apoyo Docente',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleLarge,
                    ),
                    const SizedBox(height: 32),

                    Text(
                      'Iniciar sesión',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleLarge,
                    ),
                    const SizedBox(height: 24),

                    Text(
                      'Usuario o correo electrónico',
                      style: theme.textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 8),

                    TextFormField(
                      controller: _usuarioController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: 'Ingresa tu usuario o correo',
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Ingresa tu usuario o correo.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 18),

                    Text('Contraseña', style: theme.textTheme.bodyLarge),
                    const SizedBox(height: 8),

                    TextFormField(
                      controller: _passwordController,
                      obscureText: _ocultarPassword,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => _iniciarSesion(),
                      decoration: InputDecoration(
                        hintText: 'Ingresa tu contraseña',
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          tooltip: _ocultarPassword
                              ? 'Mostrar contraseña'
                              : 'Ocultar contraseña',
                          icon: Icon(
                            _ocultarPassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                          ),
                          onPressed: () {
                            setState(() {
                              _ocultarPassword = !_ocultarPassword;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingresa tu contraseña.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 28),

                    SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        onPressed: _iniciandoSesion ? null : _iniciarSesion,
                        child: _iniciandoSesion
                            ? const SizedBox(
                                width: 22,
                                height: 22,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Text('Entrar'),
                      ),
                    ),
                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            '¿No tienes una cuenta?',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                        TextButton(
                          onPressed: _iniciandoSesion ? null : _abrirRegistro,
                          child: const Text('Crear cuenta'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
