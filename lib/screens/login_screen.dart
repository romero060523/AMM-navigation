import 'package:flutter/material.dart';
import '../models/usuario.dart';
import '../theme/app_theme.dart';
import 'menu_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailCtrl = TextEditingController();
  final _passCtrl  = TextEditingController();
  bool _obscure    = true;
  String? _error;

  void _login() {
    final email = _emailCtrl.text.trim();
    final pass  = _passCtrl.text.trim();

    if (email == usuarioPrueba.email && pass == passwordPrueba) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => MenuScreen(usuario: usuarioPrueba),
        ),
      );
    } else {
      setState(() => _error = 'Correo o contraseña incorrectos.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ícono institucional
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppTheme.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(Icons.school, color: Colors.white, size: 44),
              ),
              const SizedBox(height: 20),
              const Text(
                'SISTEMA ESCOLAR',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primary,
                  letterSpacing: 2,
                ),
              ),
              const Text(
                'Ingresa tus credenciales',
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
              const SizedBox(height: 36),

              // Formulario
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text('Correo electrónico',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 6),
                      TextField(
                        controller: _emailCtrl,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: 'ejemplo@correo.com',
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text('Contraseña',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 6),
                      TextField(
                        controller: _passCtrl,
                        obscureText: _obscure,
                        decoration: InputDecoration(
                          hintText: '••••••••',
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            icon: Icon(_obscure
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () =>
                                setState(() => _obscure = !_obscure),
                          ),
                        ),
                      ),
                      if (_error != null) ...[
                        const SizedBox(height: 10),
                        Text(_error!,
                            style: const TextStyle(
                                color: Colors.red, fontSize: 12)),
                      ],
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _login,
                          child: const Text('INICIAR SESIÓN',
                              style: TextStyle(
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Center(
                        child: Text(
                          'Demo: andy@escuela.edu / 1234',
                          style: TextStyle(fontSize: 11, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}