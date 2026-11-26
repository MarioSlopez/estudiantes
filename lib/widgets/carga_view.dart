import 'package:flutter/material.dart';

class CargaView extends StatelessWidget {
  const CargaView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 12),
          Text('Cargando estudiantes...'),
        ],
      ),
    );
  }
}
