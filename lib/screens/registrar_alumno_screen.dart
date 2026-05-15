import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class RegistrarAlumnoScreen extends StatefulWidget {
  const RegistrarAlumnoScreen({super.key});

  @override
  State<RegistrarAlumnoScreen> createState() => _RegistrarAlumnoScreenState();
}

class _RegistrarAlumnoScreenState extends State<RegistrarAlumnoScreen> {
  final _nombreCtrl   = TextEditingController();
  final _apellidoCtrl = TextEditingController();
  final _edadCtrl     = TextEditingController();
  final _emailCtrl    = TextEditingController();
  final _carreraCtrl  = TextEditingController();

  void _guardar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Alumno registrado (solo demo, no se guarda)'),
        backgroundColor: AppTheme.success,
        behavior: SnackBarBehavior.floating,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
    _nombreCtrl.clear();
    _apellidoCtrl.clear();
    _edadCtrl.clear();
    _emailCtrl.clear();
    _carreraCtrl.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('REGISTRAR ALUMNO')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14)),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'DATOS DEL ALUMNO',
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      letterSpacing: 1.5),
                ),
                const Divider(height: 20),
                _buildField('Nombre',               Icons.person_outline,  _nombreCtrl),
                const SizedBox(height: 14),
                _buildField('Apellido',              Icons.person_outline,  _apellidoCtrl),
                const SizedBox(height: 14),
                _buildField('Edad',                  Icons.cake_outlined,   _edadCtrl,
                    type: TextInputType.number),
                const SizedBox(height: 14),
                _buildField('Correo electrónico',    Icons.email_outlined,  _emailCtrl,
                    type: TextInputType.emailAddress),
                const SizedBox(height: 14),
                _buildField('Carrera',               Icons.school_outlined, _carreraCtrl),
                const SizedBox(height: 28),
                ElevatedButton.icon(
                  onPressed: _guardar,
                  icon: const Icon(Icons.save_outlined),
                  label: const Text(
                    'GUARDAR',
                    style: TextStyle(
                        letterSpacing: 1.5, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField(
    String label,
    IconData icon,
    TextEditingController ctrl, {
    TextInputType type = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 13, fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        TextField(
          controller: ctrl,
          keyboardType: type,
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            hintText: label,
          ),
        ),
      ],
    );
  }
}