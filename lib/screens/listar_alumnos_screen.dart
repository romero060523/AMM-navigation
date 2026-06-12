import 'package:flutter/cupertino.dart';
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
    return CupertinoPageScaffold(
      backgroundColor: AppTheme.background,
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Lista de Alumnos'),
        backgroundColor: CupertinoColors.systemBackground,
      ),
      child: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 24),

            // Contador
            Padding(
              padding: const EdgeInsets.only(left: 32, bottom: 6),
              child: Text(
                '${_alumnos.length} ALUMNOS REGISTRADOS',
                style: const TextStyle(
                    fontSize: 12,
                    color: AppTheme.secondaryLabel,
                    letterSpacing: 0.5),
              ),
            ),

            // Lista agrupada estilo iOS
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppTheme.secondaryBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: List.generate(_alumnos.length, (i) {
                  final a = _alumnos[i];
                  final bool last = i == _alumnos.length - 1;
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        child: Row(
                          children: [
                            // Avatar inicial
                            Container(
                              width: 38,
                              height: 38,
                              decoration: BoxDecoration(
                                color: AppTheme.primary.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(19),
                              ),
                              child: Center(
                                child: Text(
                                  a['nombre']![0],
                                  style: const TextStyle(
                                      color: AppTheme.primary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            // Nombre y carrera
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(a['nombre']!,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme.label)),
                                  const SizedBox(height: 2),
                                  Text(a['carrera']!,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: AppTheme.secondaryLabel)),
                                ],
                              ),
                            ),
                            // Código y edad
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(a['codigo']!,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: AppTheme.primary,
                                        fontWeight: FontWeight.w600)),
                                const SizedBox(height: 2),
                                Text('${a['edad']} años',
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: AppTheme.secondaryLabel)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      if (!last)
                        Container(
                          height: 0.5,
                          color: AppTheme.separator,
                          margin: const EdgeInsets.only(left: 66),
                        ),
                    ],
                  );
                }),
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}