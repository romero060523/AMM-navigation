import 'package:flutter/material.dart';
import '../models/usuario.dart';
import '../theme/app_theme.dart';

class PerfilScreen extends StatelessWidget {
  final Usuario usuario;
  const PerfilScreen({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MI PERFIL')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Avatar
            CircleAvatar(
              radius: 50,
              backgroundColor: AppTheme.primary,
              child: Text(
                usuario.nombre[0],
                style: const TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              usuario.nombre,
              style: const TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              decoration: BoxDecoration(
                color: AppTheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                usuario.rol,
                style: const TextStyle(
                    color: AppTheme.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 28),

            // Tarjeta de datos
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'INFORMACIÓN PERSONAL',
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          letterSpacing: 1.5),
                    ),
                    const Divider(height: 20),
                    _buildInfoRow(Icons.email_outlined,  'Correo',    usuario.email),
                    _buildInfoRow(Icons.cake_outlined,   'Edad',      '${usuario.edad} años'),
                    _buildInfoRow(Icons.phone_outlined,  'Teléfono',  usuario.telefono),
                    _buildInfoRow(Icons.badge_outlined,  'Rol',       usuario.rol),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppTheme.primary),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: const TextStyle(fontSize: 11, color: Colors.grey)),
              Text(value,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500)),
            ],
          ),
        ],
      ),
    );
  }
}