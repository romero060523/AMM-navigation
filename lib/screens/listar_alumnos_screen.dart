import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ListarAlumnosScreen extends StatelessWidget {
  const ListarAlumnosScreen({super.key});

  static const List<Map<String, String>> _alumnos = [
    {'nombre': 'Ana García',     'carrera': 'Ingeniería de Sistemas', 'edad': '20', 'codigo': 'A-001'},
    {'nombre': 'Luis Quispe',    'carrera': 'Administración',          'edad': '22', 'codigo': 'A-002'},
    {'nombre': 'María Torres',   'carrera': 'Contabilidad',            'edad': '19', 'codigo': 'A-003'},
    {'nombre': 'Pedro Flores',   'carrera': 'Ingeniería de Sistemas', 'edad': '21', 'codigo': 'A-004'},
    {'nombre': 'Sofía Mamani',   'carrera': 'Marketing',               'edad': '20', 'codigo': 'A-005'},
    {'nombre': 'Jorge Castillo', 'carrera': 'Derecho',                 'edad': '23', 'codigo': 'A-006'},
    {'nombre': 'Lucía Ramos',    'carrera': 'Psicología',              'edad': '21', 'codigo': 'A-007'},
    {'nombre': 'Carlos Díaz',    'carrera': 'Administración',          'edad': '22', 'codigo': 'A-008'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LISTA DE ALUMNOS')),
      body: Column(
        children: [
          // Contador
          Container(
            width: double.infinity,
            color: AppTheme.primary.withOpacity(0.07),
            padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              '${_alumnos.length} alumnos registrados',
              style: const TextStyle(
                  fontSize: 13,
                  color: AppTheme.primary,
                  fontWeight: FontWeight.w600),
            ),
          ),
          // Lista
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: _alumnos.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (_, i) {
                final a = _alumnos[i];
                return Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    leading: CircleAvatar(
                      backgroundColor:
                          AppTheme.primary.withOpacity(0.12),
                      child: Text(
                        a['nombre']![0],
                        style: const TextStyle(
                            color: AppTheme.primary,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    title: Text(a['nombre']!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14)),
                    subtitle: Text(a['carrera']!,
                        style: const TextStyle(
                            fontSize: 12, color: Colors.grey)),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(a['codigo']!,
                            style: const TextStyle(
                                fontSize: 11,
                                color: AppTheme.primary,
                                fontWeight: FontWeight.bold)),
                        Text('${a['edad']} años',
                            style: const TextStyle(
                                fontSize: 11, color: Colors.grey)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}