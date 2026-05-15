import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/login_screen.dart';

void main() => runApp(const AppEscolar());

class AppEscolar extends StatelessWidget {
  const AppEscolar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistema Escolar',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const LoginScreen(),
    );
  }
}