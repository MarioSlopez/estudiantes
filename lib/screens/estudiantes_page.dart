import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/estudiantes_cubit.dart';
import '../cubit/estudiantes_state.dart';

class EstudiantesPage extends StatelessWidget {
  const EstudiantesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Actividad 4: el título depende del estado, por eso usa BlocBuilder.
        title: BlocBuilder<EstudiantesCubit, EstudiantesState>(
          builder: (context, state) {
            final total = state is EstudiantesExito
                ? ' (${state.estudiantes.length})'
                : '';
            return Text('Consulta de estudiantes$total');
          },
        ),
        // Actividad 3: botón para regresar al estado Inicial.
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Reiniciar',
            onPressed: () => context.read<EstudiantesCubit>().reiniciar(),
          ),
        ],
      ),
      body: BlocBuilder<EstudiantesCubit, EstudiantesState>(
        builder: (context, state) {
          return switch (state) {
            EstudiantesInicial() => const Center(
                child: Text('Presiona el botón para comenzar'),
              ),
            EstudiantesCarga() => const Center(
                child: CircularProgressIndicator(),
              ),
            EstudiantesVacio() => const Center(
                child: Text('No hay estudiantes registrados'),
              ),
            EstudiantesError(:final mensaje) => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.error_outline, size: 48, color: Colors.red),
                    const SizedBox(height: 8),
                    Text(mensaje, textAlign: TextAlign.center),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () =>
                          context.read<EstudiantesCubit>().cargarEstudiantes(),
                      child: const Text('Reintentar'),
                    ),
                  ],
                ),
              ),
            EstudiantesExito(:final estudiantes) => ListView.builder(
                itemCount: estudiantes.length,
                itemBuilder: (context, index) {
                  final e = estudiantes[index];
                  return ListTile(
                    leading: CircleAvatar(child: Text('${e.id}')),
                    title: Text(e.nombre),
                    // Actividad 1: se muestra la ciudad junto al correo.
                    subtitle: Text('${e.correo}\n${e.ciudad}'),
                    isThreeLine: true,
                  );
                },
              ),
          };
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.read<EstudiantesCubit>().cargarEstudiantes(),
        icon: const Icon(Icons.download),
        label: const Text('Cargar estudiantes'),
      ),
    );
  }
}