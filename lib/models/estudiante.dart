class Estudiante {
  final int id;
  final String nombre;
  final String correo;
  final String ciudad;

  const Estudiante({
    required this.id,
    required this.nombre,
    required this.correo,
    required this.ciudad,
  });

  // Primera letra del primer nombre y del último apellido, por ejemplo "LG".
  String get iniciales {
    final partes = nombre.trim().split(RegExp(r'\s+'));
    if (partes.length == 1) return partes.first[0].toUpperCase();
    return (partes.first[0] + partes.last[0]).toUpperCase();
  }

  // Convierte el JSON de la API en un objeto Estudiante.
  factory Estudiante.fromJson(Map<String, dynamic> json) {
    return Estudiante(
      id: json['id'] as int,
      nombre: json['name'] as String,
      correo: json['email'] as String,
      ciudad: json['address']['city'] as String,
    );
  }
}