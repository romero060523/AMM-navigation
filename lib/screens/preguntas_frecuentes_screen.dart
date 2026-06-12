import 'package:flutter/cupertino.dart';
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
          'El proceso de matrícula se realiza en línea a través del portal institucional durante las fechas publicadas cada semestre. Debes tener tu código de alumno y contraseña.',
    },
    {
      'pregunta': '¿Qué documentos necesito para matricularme?',
      'respuesta':
          'Necesitas: DNI original y copia, voucher de pago de matrícula, foto tamaño carnet, y certificado de estudios del nivel anterior (solo para ingresantes nuevos).',
    },
    {
      'pregunta': '¿Cómo recupero mi contraseña?',
      'respuesta':
          'Selecciona "¿Olvidé mi contraseña?" en el inicio de sesión. Ingresa tu correo institucional y recibirás un enlace para restablecerla. Si persiste el problema, acude a Soporte Técnico.',
    },
    {
      'pregunta': '¿Cuándo se publican las notas?',
      'respuesta':
          'Las notas se publican dentro de los 5 días hábiles posteriores al examen o entrega final. Consúltalas en el módulo "Mis Notas" del portal del estudiante.',
    },
    {
      'pregunta': '¿Cómo solicito un certificado de estudios?',
      'respuesta':
          'En el portal institucional ve a "Trámites" → "Certificado de Estudios" y realiza el pago. El documento estará listo en 3 a 5 días hábiles.',
    },
    {
      'pregunta': '¿Qué hago si tengo problemas con el sistema?',
      'respuesta':
          'Contáctate con Soporte Técnico: soporte@escuela.edu o piso 2 del edificio principal. Atención de 8:00 a.m. a 5:00 p.m.',
    },
  ];

  final Set<int> _expandidos = {};

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppTheme.background,
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Preguntas Frecuentes'),
        backgroundColor: CupertinoColors.systemBackground,
      ),
      child: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.only(left: 32, bottom: 6),
              child: const Text(
                'AYUDA E INFORMACIÓN',
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
                children: List.generate(_faqs.length, (i) {
                  final bool abierto = _expandidos.contains(i);
                  final bool last = i == _faqs.length - 1;

                  return Column(
                    children: [
                      // Fila pregunta
                      GestureDetector(
                        onTap: () => setState(() {
                          abierto
                              ? _expandidos.remove(i)
                              : _expandidos.add(i);
                        }),
                        behavior: HitTestBehavior.opaque,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 14),
                          child: Row(
                            children: [
                              Container(
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                  color: AppTheme.purple.withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Center(
                                  child: Text('?',
                                      style: TextStyle(
                                          color: AppTheme.purple,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  _faqs[i]['pregunta']!,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: AppTheme.label),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(
                                abierto
                                    ? CupertinoIcons.chevron_up
                                    : CupertinoIcons.chevron_down_circle,
                                size: 14,
                                color: AppTheme.secondaryLabel,
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Respuesta expandible
                      if (abierto)
                        Container(
                          width: double.infinity,
                          color: CupertinoColors.systemGrey6,
                          padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
                          child: Text(
                            _faqs[i]['respuesta']!,
                            style: const TextStyle(
                                fontSize: 14,
                                color: AppTheme.secondaryLabel,
                                height: 1.5),
                          ),
                        ),

                      if (!last)
                        Container(
                          height: 0.5,
                          color: AppTheme.separator,
                          margin: const EdgeInsets.only(left: 56),
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