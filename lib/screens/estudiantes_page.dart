import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/estudiantes_cubit.dart';
import '../cubit/estudiantes_state.dart';
import '../widgets/estudiante_card.dart';
import '../widgets/mensaje_estado.dart';

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
            EstudiantesInicial() => const MensajeEstado(
                icono: Icons.school,
                mensaje: 'Presiona el botón para comenzar',
              ),
            EstudiantesCarga() => const Center(
                child: CircularProgressIndicator(),
              ),
            EstudiantesVacio() => const MensajeEstado(
                icono: Icons.inbox,
                mensaje: 'No hay estudiantes registrados',
                color: Colors.grey,
              ),
            EstudiantesError(:final mensaje) => MensajeEstado(
                icono: Icons.error_outline,
                mensaje: mensaje,
                color: Colors.red,
                accion: ElevatedButton(
                  onPressed: () =>
                      context.read<EstudiantesCubit>().cargarEstudiantes(),
                  child: const Text('Reintentar'),
                ),
              ),
            EstudiantesExito(:final estudiantes) => ListView.builder(
                itemCount: estudiantes.length,
                itemBuilder: (context, index) =>
                    EstudianteCard(estudiante: estudiantes[index]),
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