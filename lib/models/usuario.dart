class Usuario {
  final String nombre;
  final String email;
  final String edad;
  final String telefono;
  final String rol;

  const Usuario({
    required this.nombre,
    required this.email,
    required this.edad,
    required this.telefono,
    required this.rol,
  });
}

const usuarioPrueba = Usuario(
  nombre: 'Andy Romero Poma',
  email: 'andy@tecsup.edu',
  edad: '20',
  telefono: '+51 987 654 321',
  rol: 'Administrador',
);

const passwordPrueba = '1234';