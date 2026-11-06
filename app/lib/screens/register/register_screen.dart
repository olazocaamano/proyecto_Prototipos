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
    return RegistroResultado.error(
      'No se pudo completar la petición: ${e.message}',
    );
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
  final _formKey = GlobalKey<FormState>();
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

  bool _ocultarPassword = true;
  bool _ocultarConfirmacion = true;
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

  void _mostrarMensaje(String mensaje, {bool error = false}) {
    final colores = Theme.of(context).colorScheme;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        backgroundColor: error ? colores.error : colores.primary,
      ),
    );
  }

  String? _validarObligatorio(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Este campo es obligatorio.';
    }

    return null;
  }

  String? _validarCorreo(String? value) {
    final obligatorio = _validarObligatorio(value);

    if (obligatorio != null) return obligatorio;

    final correo = value!.trim();

    if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(correo)) {
      return 'Ingresa un correo electrónico válido.';
    }

    return null;
  }

  Future<void> _crearCuenta() async {
    if (_enviando) return;

    if (!_formKey.currentState!.validate()) return;

    if (_passwordController.text != _confirmPasswordController.text) {
      _mostrarMensaje('Las contraseñas no coinciden.', error: true);
      return;
    }

    if (_passwordController.text.length < 8) {
      _mostrarMensaje(
        'La contraseña debe tener al menos 8 caracteres.',
        error: true,
      );
      return;
    }

    setState(() {
      _enviando = true;
    });

    final resultado = await registrarDocente(
      _usernameController.text,
      _emailController.text,
      _passwordController.text,
      _nombreController.text,
      _apellidosController.text,
    );

    // La pantalla pudo cerrarse mientras esperábamos la respuesta
    if (!mounted) return;

    setState(() {
      _enviando = false;
    });

    _mostrarMensaje(resultado.mensaje, error: !resultado.ok);

    if (resultado.ok) {
      _passwordController.clear();
      _confirmPasswordController.clear();
    }
  }

  Widget _crearCampo({
    required String etiqueta,
    required String sugerencia,
    required IconData icono,
    required TextEditingController controller,
    String? Function(String?)? validar,
    TextInputType? tipoTeclado,
    TextInputAction? accionTeclado,
    bool ocultarTexto = false,
    Widget? iconoFinal,
    void Function(String)? alEnviar,
  }) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(etiqueta, style: theme.textTheme.bodyLarge),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: tipoTeclado,
          textInputAction: accionTeclado,
          obscureText: ocultarTexto,
          validator: validar,
          onFieldSubmitted: alEnviar,
          decoration: InputDecoration(
            hintText: sugerencia,
            prefixIcon: Icon(icono),
            suffixIcon: iconoFinal,
          ),
        ),
      ],
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
                      'Crear cuenta',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleLarge,
                    ),
                    const SizedBox(height: 32),

                    _crearCampo(
                      etiqueta: 'Nombre',
                      sugerencia: 'Ingresa tu nombre',
                      icono: Icons.badge_outlined,
                      controller: _nombreController,
                      accionTeclado: TextInputAction.next,
                      validar: _validarObligatorio,
                    ),
                    const SizedBox(height: 18),

                    _crearCampo(
                      etiqueta: 'Apellidos',
                      sugerencia: 'Ingresa tus apellidos',
                      icono: Icons.badge_outlined,
                      controller: _apellidosController,
                      accionTeclado: TextInputAction.next,
                      validar: _validarObligatorio,
                    ),
                    const SizedBox(height: 18),

                    _crearCampo(
                      etiqueta: 'Usuario',
                      sugerencia: 'Elige un nombre de usuario',
                      icono: Icons.person_outline,
                      controller: _usernameController,
                      accionTeclado: TextInputAction.next,
                      validar: _validarObligatorio,
                    ),
                    const SizedBox(height: 18),

                    _crearCampo(
                      etiqueta: 'Correo electrónico',
                      sugerencia: 'ejemplo@correo.com',
                      icono: Icons.email_outlined,
                      controller: _emailController,
                      tipoTeclado: TextInputType.emailAddress,
                      accionTeclado: TextInputAction.next,
                      validar: _validarCorreo,
                    ),
                    const SizedBox(height: 18),

                    _crearCampo(
                      etiqueta: 'Contraseña',
                      sugerencia: 'Crea una contraseña',
                      icono: Icons.lock_outline,
                      controller: _passwordController,
                      accionTeclado: TextInputAction.next,
                      ocultarTexto: _ocultarPassword,
                      validar: _validarObligatorio,
                      iconoFinal: IconButton(
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
                    const SizedBox(height: 18),

                    _crearCampo(
                      etiqueta: 'Confirmar contraseña',
                      sugerencia: 'Repite tu contraseña',
                      icono: Icons.lock_reset_outlined,
                      controller: _confirmPasswordController,
                      accionTeclado: TextInputAction.done,
                      ocultarTexto: _ocultarConfirmacion,
                      validar: _validarObligatorio,
                      alEnviar: (_) => _crearCuenta(),
                      iconoFinal: IconButton(
                        tooltip: _ocultarConfirmacion
                            ? 'Mostrar contraseña'
                            : 'Ocultar contraseña',
                        icon: Icon(
                          _ocultarConfirmacion
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                        onPressed: () {
                          setState(() {
                            _ocultarConfirmacion = !_ocultarConfirmacion;
                          });
                        },
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
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Text('Crear cuenta'),
                      ),
                    ),
                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            '¿Ya tienes cuenta?',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                        TextButton(
                          onPressed: _enviando
                              ? null
                              : () => Navigator.pop(context),
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
      ),
    );
  }
}
