import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class PreguntasFrecuentesScreen extends StatefulWidget {
  const PreguntasFrecuentesScreen({super.key});

  @override
  State<PreguntasFrecuentesScreen> createState() =>
      _PreguntasFrecuentesScreenState();
}

class _PreguntasFrecuentesScreenState
    extends State<PreguntasFrecuentesScreen> {
  static const List<Map<String, String>> _faqs = [
    {
      'pregunta': '¿Cuáles son los horarios de atención?',
      'respuesta':
          'La institución atiende de lunes a viernes de 8:00 a.m. a 6:00 p.m. y los sábados de 9:00 a.m. a 1:00 p.m. No se atiende domingos ni feriados.',
    },
    {
      'pregunta': '¿Cómo realizo mi matrícula?',
      'respuesta':
          'El proceso de matrícula se realiza en línea a través del portal institucional durante las fechas publicadas cada semestre. Debes tener tu código de alumno y contraseña. Si es tu primera matrícula, acércate a la oficina de Admisión con tu DNI.',
    },
    {
      'pregunta': '¿Qué documentos necesito para matricularme?',
      'respuesta':
          'Necesitas: DNI original y copia, voucher de pago de matrícula, foto tamaño carnet, y certificado de estudios del nivel anterior (solo para ingresantes nuevos).',
    },
    {
      'pregunta': '¿Cómo recupero mi contraseña?',
      'respuesta':
          'Dirígete a la página de inicio de sesión y selecciona "¿Olvidé mi contraseña?". Ingresa tu correo institucional y recibirás un enlace para restablecerla. Si el problema persiste, acude a la oficina de Soporte Técnico.',
    },
    {
      'pregunta': '¿Cuándo se publican las notas?',
      'respuesta':
          'Las notas se publican en el sistema dentro de los 5 días hábiles posteriores a la fecha del examen o entrega final. Puedes consultarlas en el módulo "Mis Notas" del portal del estudiante.',
    },
    {
      'pregunta': '¿Cómo solicito un certificado de estudios?',
      'respuesta':
          'Ingresa al portal institucional, ve a la sección "Trámites", selecciona "Certificado de Estudios" y realiza el pago correspondiente. El documento estará listo en un plazo de 3 a 5 días hábiles.',
    },
    {
      'pregunta': '¿Qué hago si tengo problemas con el sistema?',
      'respuesta':
          'Contáctate con el área de Soporte Técnico al correo soporte@escuela.edu o acércate al piso 2 del edificio principal. El horario de atención es de 8:00 a.m. a 5:00 p.m.',
    },
  ];

  final Set<int> _expandidos = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PREGUNTAS FRECUENTES')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _faqs.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (_, i) {
          final bool abierto = _expandidos.contains(i);
          return Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () => setState(() {
                abierto ? _expandidos.remove(i) : _expandidos.add(i);
              }),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color: AppTheme.purple.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Text('?',
                                style: TextStyle(
                                    color: AppTheme.purple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            _faqs[i]['pregunta']!,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ),
                        Icon(
                          abierto
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    if (abierto) ...[
                      const SizedBox(height: 12),
                      const Divider(height: 1),
                      const SizedBox(height: 12),
                      Text(
                        _faqs[i]['respuesta']!,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black87,
                            height: 1.5),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}