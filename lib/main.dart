import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/estudiantes_cubit.dart';
import 'screens/estudiantes_page.dart';
import 'services/estudiante_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Práctica Cubit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.teal,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(centerTitle: true),
      ),
      home: BlocProvider(
        // Para probar el estado Vacío: EstudianteService(simularVacio: true)
        create: (_) => EstudiantesCubit(const EstudianteService()),
        child: const EstudiantesPage(),
      ),
    );
  }
}