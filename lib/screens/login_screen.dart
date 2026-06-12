import 'package:flutter/cupertino.dart';
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
        CupertinoPageRoute(
          builder: (_) => MenuScreen(usuario: usuarioPrueba),
        ),
      );
    } else {
      setState(() => _error = 'Correo o contraseña incorrectos.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppTheme.background,
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
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
                  child: const Icon(
                    CupertinoIcons.book_fill,
                    color: CupertinoColors.white,
                    size: 40,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'SISTEMA ESCOLAR',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primary,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Ingresa tus credenciales',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppTheme.secondaryLabel,
                  ),
                ),
                const SizedBox(height: 36),

                // Formulario estilo iOS (fondo blanco, bordes redondeados)
                Container(
                  decoration: BoxDecoration(
                    color: AppTheme.secondaryBg,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      // Campo email
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        child: CupertinoTextField(
                          controller: _emailCtrl,
                          placeholder: 'Correo electrónico',
                          keyboardType: TextInputType.emailAddress,
                          prefix: const Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Icon(CupertinoIcons.at,
                                color: AppTheme.secondaryLabel, size: 18),
                          ),
                          decoration: const BoxDecoration(),
                          padding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 8),
                        ),
                      ),
                      Container(height: 0.5, color: AppTheme.separator,
                          margin: const EdgeInsets.only(left: 44)),
                      // Campo contraseña
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        child: CupertinoTextField(
                          controller: _passCtrl,
                          placeholder: 'Contraseña',
                          obscureText: _obscure,
                          prefix: const Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Icon(CupertinoIcons.lock,
                                color: AppTheme.secondaryLabel, size: 18),
                          ),
                          suffix: GestureDetector(
                            onTap: () => setState(() => _obscure = !_obscure),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Icon(
                                _obscure
                                    ? CupertinoIcons.eye_slash
                                    : CupertinoIcons.eye,
                                color: AppTheme.secondaryLabel,
                                size: 18,
                              ),
                            ),
                          ),
                          decoration: const BoxDecoration(),
                          padding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 8),
                        ),
                      ),
                    ],
                  ),
                ),

                // Error
                if (_error != null) ...[
                  const SizedBox(height: 10),
                  Text(
                    _error!,
                    style: const TextStyle(
                        color: AppTheme.danger, fontSize: 13),
                  ),
                ],

                const SizedBox(height: 24),

                // Botón login
                SizedBox(
                  width: double.infinity,
                  child: CupertinoButton.filled(
                    borderRadius: BorderRadius.circular(12),
                    onPressed: _login,
                    child: const Text(
                      'Iniciar Sesión',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),

                const SizedBox(height: 16),
                const Text(
                  'Demo: andy@tecsup.edu / 1234',
                  style: TextStyle(
                      fontSize: 12, color: AppTheme.secondaryLabel),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}