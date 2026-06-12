import 'package:flutter/cupertino.dart';
import '../models/usuario.dart';
import '../theme/app_theme.dart';
import 'login_screen.dart';
import 'perfil_screen.dart';
import 'registrar_alumno_screen.dart';
import 'listar_alumnos_screen.dart';
import 'preguntas_frecuentes_screen.dart';

class MenuScreen extends StatelessWidget {
  final Usuario usuario;
  const MenuScreen({super.key, required this.usuario});

  void _cerrarSesion(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: const Text('Cerrar Sesión'),
        content: const Text('¿Estás seguro que deseas salir?'),
        actions: [
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () => Navigator.pushAndRemoveUntil(
              context,
              CupertinoPageRoute(builder: (_) => const LoginScreen()),
              (_) => false,
            ),
            child: const Text('Salir'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
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
        middle: Text('Menú Principal'),
        backgroundColor: CupertinoColors.systemBackground,
      ),
      child: SafeArea(
        child: ListView(
          children: [
            // Bienvenida
            Container(
              color: AppTheme.secondaryBg,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppTheme.primary,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Center(
                      child: Text(
                        usuario.nombre[0],
                        style: const TextStyle(
                            color: CupertinoColors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Bienvenido',
                          style: TextStyle(
                              fontSize: 12,
                              color: AppTheme.secondaryLabel)),
                      Text(usuario.nombre,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.label)),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Sección opciones
            _buildSectionLabel('OPCIONES'),
            Container(
              decoration: BoxDecoration(
                color: AppTheme.secondaryBg,
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _buildRow(
                    context,
                    icon: CupertinoIcons.person_alt_circle,
                    color: AppTheme.primary,
                    titulo: 'Perfil',
                    onTap: () => Navigator.push(context,
                        CupertinoPageRoute(
                            builder: (_) => PerfilScreen(usuario: usuario))),
                  ),
                  _buildDivider(),
                  _buildRow(
                    context,
                    icon: CupertinoIcons.person_add,
                    color: AppTheme.success,
                    titulo: 'Registrar Alumno',
                    onTap: () => Navigator.push(context,
                        CupertinoPageRoute(
                            builder: (_) => const RegistrarAlumnoScreen())),
                  ),
                  _buildDivider(),
                  _buildRow(
                    context,
                    icon: CupertinoIcons.book,
                    color: AppTheme.teal,
                    titulo: 'Listar Alumnos',
                    onTap: () => Navigator.push(context,
                        CupertinoPageRoute(
                            builder: (_) => const ListarAlumnosScreen())),
                  ),
                  _buildDivider(),
                  _buildRow(
                    context,
                    icon: CupertinoIcons.chat_bubble,
                    color: AppTheme.purple,
                    titulo: 'Preguntas Frecuentes',
                    onTap: () => Navigator.push(context,
                        CupertinoPageRoute(
                            builder: (_) =>
                                const PreguntasFrecuentesScreen())),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Cerrar sesión separado (rojo, estilo iOS)
            _buildSectionLabel('CUENTA'),
            Container(
              decoration: BoxDecoration(
                color: AppTheme.secondaryBg,
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildRow(
                context,
                icon: CupertinoIcons.clear_circled,
                color: AppTheme.danger,
                titulo: 'Cerrar Sesión',
                textColor: AppTheme.danger,
                showChevron: false,
                onTap: () => _cerrarSesion(context),
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, bottom: 6),
      child: Text(
        label,
        style: const TextStyle(
            fontSize: 12,
            color: AppTheme.secondaryLabel,
            letterSpacing: 0.5),
      ),
    );
  }

  Widget _buildRow(
    BuildContext context, {
    required IconData icon,
    required Color color,
    required String titulo,
    required VoidCallback onTap,
    Color textColor = AppTheme.label,
    bool showChevron = true,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
        child: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Icon(icon, color: CupertinoColors.white, size: 17),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(titulo,
                  style: TextStyle(fontSize: 16, color: textColor)),
            ),
            if (showChevron)
              const Icon(CupertinoIcons.chevron_forward,
                  color: AppTheme.secondaryLabel, size: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() => Container(
        height: 0.5,
        color: AppTheme.separator,
        margin: const EdgeInsets.only(left: 60),
      );
}