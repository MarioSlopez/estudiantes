import 'package:flutter/material.dart';

import '../models/estudiante.dart';

class EstudianteCard extends StatelessWidget {
  final Estudiante estudiante;

  const EstudianteCard({super.key, required this.estudiante});

  @override
  Widget build(BuildContext context) {
    final colores = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: CircleAvatar(child: Text(estudiante.iniciales)),
        title: Text(
          estudiante.nombre,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.email_outlined, size: 16, color: colores.primary),
                const SizedBox(width: 6),
                Expanded(child: Text(estudiante.correo)),
              ],
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                Icon(Icons.location_city, size: 16, color: colores.primary),
                const SizedBox(width: 6),
                Text(estudiante.ciudad),
              ],
            ),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }
}