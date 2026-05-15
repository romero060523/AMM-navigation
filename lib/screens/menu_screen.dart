import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    final opciones = [
      _MenuOpcion(
        icon: Icons.person_outline,
        titulo: 'Perfil',
        subtitulo: 'Ver mis datos',
        color: AppTheme.primary,
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (_) => PerfilScreen(usuario: usuario))),
      ),
      _MenuOpcion(
        icon: Icons.person_add_outlined,
        titulo: 'Registrar Alumno',
        subtitulo: 'Agregar nuevo alumno',
        color: AppTheme.success,
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (_) => const RegistrarAlumnoScreen())),
      ),
      _MenuOpcion(
        icon: Icons.list_alt_outlined,
        titulo: 'Listar Alumnos',
        subtitulo: 'Ver todos los alumnos',
        color: AppTheme.teal,
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (_) => const ListarAlumnosScreen())),
      ),
      _MenuOpcion(
        icon: Icons.help_outline,
        titulo: 'Preguntas Frecuentes',
        subtitulo: 'Ayuda e información',
        color: AppTheme.purple,
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => const PreguntasFrecuentesScreen())),
      ),
      _MenuOpcion(
        icon: Icons.logout,
        titulo: 'Cerrar Sesión',
        subtitulo: 'Salir del sistema',
        color: AppTheme.danger,
        onTap: () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
          (_) => false,
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('MENÚ PRINCIPAL'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          // Bienvenida
          Container(
            width: double.infinity,
            color: AppTheme.primary.withOpacity(0.07),
            padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppTheme.primary,
                  radius: 22,
                  child: Text(
                    usuario.nombre[0],
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Bienvenido,',
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey[600])),
                    Text(usuario.nombre,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
          // Lista de opciones
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: opciones.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (_, i) => _buildMenuCard(opciones[i]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard(_MenuOpcion op) {
    return Card(
      elevation: 2,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: op.color.withOpacity(0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(op.icon, color: op.color, size: 24),
        ),
        title: Text(op.titulo,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15)),
        subtitle: Text(op.subtitulo,
            style: const TextStyle(fontSize: 12, color: Colors.grey)),
        trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
        onTap: op.onTap,
      ),
    );
  }
}

class _MenuOpcion {
  final IconData icon;
  final String titulo;
  final String subtitulo;
  final Color color;
  final VoidCallback onTap;

  const _MenuOpcion({
    required this.icon,
    required this.titulo,
    required this.subtitulo,
    required this.color,
    required this.onTap,
  });
}