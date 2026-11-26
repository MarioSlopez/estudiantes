import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../services/estudiante_service.dart';
import 'estudiantes_state.dart';

class EstudiantesCubit extends Cubit<EstudiantesState> {
  final EstudianteService _servicio;

  EstudiantesCubit(this._servicio) : super(const EstudiantesInicial());

  Future<void> cargarEstudiantes() async {
    emit(const EstudiantesCarga());

    try {
      final datos = await _servicio.obtenerEstudiantes();

      if (datos.isEmpty) {
        emit(const EstudiantesVacio());
      } else {
        emit(EstudiantesExito(datos));
      }
    } on TimeoutException {
      emit(
        const EstudiantesError(
          'Tiempo de espera agotado. El servidor tardó demasiado en responder.',
        ),
      );
    } on http.ClientException {
      emit(
        const EstudiantesError(
          'Sin conexión a internet. Revisa tu red e inténtalo de nuevo.',
        ),
      );
    } catch (e) {
      emit(const EstudiantesError('Error del servidor. Inténtalo más tarde.'));
    }
  }

  // Ordena alfabéticamente la lista que se está mostrando.
  void ordenarPorNombre() {
    final actual = state;
    if (actual is! EstudiantesExito) return;
    final lista = [...actual.estudiantes]
      ..sort((a, b) => a.nombre.compareTo(b.nombre));
    emit(EstudiantesExito(lista));
  }

  void reiniciar() => emit(const EstudiantesInicial());
}
