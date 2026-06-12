import 'package:flutter/cupertino.dart';
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
    showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: const Text('Registrado'),
        content: const Text('Alumno guardado correctamente (solo demo).'),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              _nombreCtrl.clear();
              _apellidoCtrl.clear();
              _edadCtrl.clear();
              _emailCtrl.clear();
              _carreraCtrl.clear();
            },
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppTheme.background,
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Registrar Alumno'),
        backgroundColor: CupertinoColors.systemBackground,
      ),
      child: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.only(left: 32, bottom: 6),
              child: const Text(
                'DATOS DEL ALUMNO',
                style: TextStyle(
                    fontSize: 12,
                    color: AppTheme.secondaryLabel,
                    letterSpacing: 0.5),
              ),
            ),

            // Campos agrupados estilo iOS
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppTheme.secondaryBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildField(
                    icon: CupertinoIcons.person_add,
                    placeholder: 'Nombre',
                    controller: _nombreCtrl,
                  ),
                  _buildDivider(),
                  _buildField(
                    icon: CupertinoIcons.person_add,
                    placeholder: 'Apellido',
                    controller: _apellidoCtrl,
                  ),
                  _buildDivider(),
                  _buildField(
                    icon: CupertinoIcons.textformat_123,
                    placeholder: 'Edad',
                    controller: _edadCtrl,
                    type: TextInputType.number,
                  ),
                  _buildDivider(),
                  _buildField(
                    icon: CupertinoIcons.at,
                    placeholder: 'Correo electrónico',
                    controller: _emailCtrl,
                    type: TextInputType.emailAddress,
                  ),
                  _buildDivider(),
                  _buildField(
                    icon: CupertinoIcons.book,
                    placeholder: 'Carrera',
                    controller: _carreraCtrl,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // Botón guardar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CupertinoButton.filled(
                borderRadius: BorderRadius.circular(12),
                onPressed: _guardar,
                child: const Text(
                  'Guardar',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),

            const SizedBox(height: 12),
            const Center(
              child: Text(
                'Los datos no se guardan (modo demo)',
                style: TextStyle(
                    fontSize: 12, color: AppTheme.secondaryLabel),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildField({
    required IconData icon,
    required String placeholder,
    required TextEditingController controller,
    TextInputType type = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: CupertinoTextField(
        controller: controller,
        placeholder: placeholder,
        keyboardType: type,
        prefix: Padding(
          padding: const EdgeInsets.only(left: 4, right: 8),
          child: Icon(icon, color: AppTheme.secondaryLabel, size: 18),
        ),
        decoration: const BoxDecoration(),
        padding: const EdgeInsets.symmetric(vertical: 13),
      ),
    );
  }

  Widget _buildDivider() => Container(
        height: 0.5,
        color: AppTheme.separator,
        margin: const EdgeInsets.only(left: 48),
      );
}