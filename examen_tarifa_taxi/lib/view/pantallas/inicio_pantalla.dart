import 'package:flutter/material.dart';

class InicioPantalla extends StatelessWidget {
  const InicioPantalla({super.key});

  static const Color amarilloSuave = Color(0xFFE6BA38);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Cooperativa de Taxis'),
        backgroundColor: amarilloSuave,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ícono de taxi estilizado
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF9E8), // Blanco crema suave
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFF3DE9C), width: 2),
                ),
                child: const Icon(
                  Icons.local_taxi,
                  size: 80,
                  color: amarilloSuave,
                ),
              ),
              const SizedBox(height: 30),

              // Título
              const Text(
                'Cálculo de Carrera',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),

              // Subtítulo explicativo
              Text(
                'Calcula el valor exacto de tu viaje en base a los kilómetros recorridos y el horario del servicio.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.grey.shade600, height: 1.4),
              ),
              const SizedBox(height: 40),

              // Botón para ir a la pantalla principal
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/principal');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: amarilloSuave,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 36,
                    vertical: 16,
                  ),
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.arrow_forward),
                label: const Text(
                  'Comenzar',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
