import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view_model/tarifa_viewmodel.dart';
import 'view/pantallas/inicio_pantalla.dart';
import 'view/pantallas/principal_pantalla.dart';
import 'view/pantallas/resultado_pantalla.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TarifaViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const Color amarilloSuave = Color(0xFFE6BA38);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tarifa Taxi',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: amarilloSuave,
          primary: amarilloSuave,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const InicioPantalla(),
        '/principal': (context) => const PrincipalPantalla(),
        '/resultado': (context) => const ResultadoPantalla(),
      },
    );
  }
}
