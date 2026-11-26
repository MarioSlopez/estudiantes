import 'package:flutter/material.dart';
class MensajeEstado extends StatelessWidget {
  final IconData icono;
  final String mensaje;
  final Color? color;
  final Widget? accion;

  const MensajeEstado({
    super.key,
    required this.icono,
    required this.mensaje,
    this.color,
    this.accion,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icono,
              size: 64,
              color: color ?? Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 12),
            Text(
              mensaje,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            if (accion != null) ...[
              const SizedBox(height: 16),
              accion!,
            ],
          ],
        ),
      ),
    );
  }
}