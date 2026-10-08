// Pantalla del registro
// es el formulario para que cree su cuenta

import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //cuerpo principal
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),

            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Encabezado

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

                  // campo nombre
                  Text(
                    'Nombre',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),

                  const SizedBox(height: 8),

                  const TextField(
                    decoration: InputDecoration(hintText: 'Ingrese su nombre'),
                  ),

                  const SizedBox(height: 18),

                  //apellidos
                  Text(
                    'Apellidos',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),

                  const SizedBox(height: 8),

                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Ingrese sus apellidos',
                    ),
                  ),

                  const SizedBox(height: 18),

                  //usuario
                  Text(
                    'Usuario',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),

                  const SizedBox(height: 8),

                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Ingrese un nombre de usuario',
                    ),
                  ),

                  const SizedBox(height: 18),

                  //correo electronico
                  Text(
                    'Correo electrónico',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),

                  const SizedBox(height: 8),

                  const TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(hintText: 'ejemplo@correo.com'),
                  ),

                  const SizedBox(height: 18),

                  //contraseña
                  Text(
                    'Contraseña',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),

                  const SizedBox(height: 8),

                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Cree una contraseña',
                    ),
                  ),

                  const SizedBox(height: 8),

                  //confirmar contraseña
                  Text(
                    'Confirme su contraseña',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),

                  const SizedBox(height: 8),

                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Repita su contraseña',
                    ),
                  ),

                  const SizedBox(height: 28),

                  //boton crear cuenta
                  SizedBox(
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {
                        //funcionalidad
                      },
                      child: const Text(
                        'Crear cuenta',
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  //enlace para inicio de sesion
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '¿Ya tienes cuenta?',
                        style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      TextButton(
                        onPressed: () {
                          //navegacion
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
