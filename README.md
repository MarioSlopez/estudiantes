# Práctica Cubit: consulta de estudiantes

App en Flutter que consulta jsonplaceholder.typicode.com/users y maneja la
consulta con Cubit (flutter_bloc).

## Estados
Inicial, Carga, Éxito, Vacío y Error.

## Estructura
- models/estudiante.dart: modelo con fromJson e iniciales
- services/estudiante_service.dart: petición HTTP
- cubit/estudiantes_state.dart: los cinco estados (sealed + Equatable)
- cubit/estudiantes_cubit.dart: lógica, ordenar y filtrar
- screens/estudiantes_page.dart: pantalla con BlocBuilder
- widgets/: EstudianteCard, MensajeEstado y CargaView

## Ejecutar
flutter pub get
flutter run
## 📄 Reporte

[Ver Reporte del rediseño de estados](https://github.com/MarioSlopez/estudiantes/blob/main/Reporte_Practica_Cubit_Redisenio_Mario_Diego.pdf)
