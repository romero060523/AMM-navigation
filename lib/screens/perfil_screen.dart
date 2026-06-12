import 'package:flutter/cupertino.dart';
import '../models/usuario.dart';
import '../theme/app_theme.dart';

class PerfilScreen extends StatelessWidget {
  final Usuario usuario;
  const PerfilScreen({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppTheme.background,
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Mi Perfil'),
        backgroundColor: CupertinoColors.systemBackground,
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const SizedBox(height: 32),

            // Avatar
            Center(
              child: Column(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: AppTheme.primary,
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: Center(
                      child: Text(
                        usuario.nombre[0],
                        style: const TextStyle(
                            fontSize: 40,
                            color: CupertinoColors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    usuario.nombre,
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.label),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.primary.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      usuario.rol,
                      style: const TextStyle(
                          color: AppTheme.primary,
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Sección datos
            Padding(
              padding: const EdgeInsets.only(left: 32, bottom: 6),
              child: const Text(
                'INFORMACIÓN PERSONAL',
                style: TextStyle(
                    fontSize: 12,
                    color: AppTheme.secondaryLabel,
                    letterSpacing: 0.5),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppTheme.secondaryBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildInfoRow(CupertinoIcons.at,            'Correo',    usuario.email),
                  _buildDivider(),
                  _buildInfoRow(CupertinoIcons.textformat_123, 'Edad',     '${usuario.edad} años'),
                  _buildDivider(),
                  _buildInfoRow(CupertinoIcons.phone,          'Teléfono', usuario.telefono),
                  _buildDivider(),
                  _buildInfoRow(CupertinoIcons.shield,         'Rol',      usuario.rol),
                ],
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppTheme.primary),
          const SizedBox(width: 14),
          Text(label,
              style: const TextStyle(
                  fontSize: 15, color: AppTheme.secondaryLabel)),
          const Spacer(),
          Text(value,
              style: const TextStyle(
                  fontSize: 15,
                  color: AppTheme.label,
                  fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildDivider() => Container(
        height: 0.5,
        color: AppTheme.separator,
        margin: const EdgeInsets.only(left: 48),
      );
}