import 'package:flutter/material.dart';
import '../../model/tarifa_modelo.dart';

class ResultadoPantalla extends StatelessWidget {
  const ResultadoPantalla({super.key});

  static const Color amarilloSuave = Color(0xFFE6BA38);

  Widget _filaDato(String etiqueta, String valor, {bool esNegrita = false, Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            etiqueta,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade700,
              fontWeight: esNegrita ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            valor,
            style: TextStyle(
              fontSize: 16,
              fontWeight: esNegrita ? FontWeight.bold : FontWeight.w600,
              color: color ?? Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tarifa = ModalRoute.of(context)!.settings.arguments as TarifaModelo;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Resumen de Carrera'),
        backgroundColor: amarilloSuave,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        child: Column(
          children: [
            // Tarjeta de resultados blanca y limpia
            Card(
              color: Colors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: Colors.grey.shade200),
              ),
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Center(
                      child: Icon(
                        Icons.receipt_long_outlined,
                        size: 54,
                        color: amarilloSuave,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Center(
                      child: Text(
                        'Detalle del Pago',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Divider(color: Colors.grey.shade200),

                    // Datos del recorrido
                    _filaDato('Distancia recorrida:', '${tarifa.kilometros.toStringAsFixed(2)} km'),
                    _filaDato('Horario del viaje:', tarifa.horario),
                    _filaDato('Costo del recorrido:', '\$${tarifa.costoRecorrido.toStringAsFixed(2)}'),
                    _filaDato(
                      'Recargo nocturno:',
                      '\$${tarifa.recargo.toStringAsFixed(2)}',
                      color: tarifa.recargo > 0 ? amarilloSuave : Colors.grey.shade500,
                    ),

                    Divider(color: Colors.grey.shade300, thickness: 1),
                    const SizedBox(height: 12),

                    // Total a pagar destacado
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF9E8), // Fondo suave crema
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFFF3DE9C)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'TOTAL A PAGAR:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            '\$${tarifa.total.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFC79B1C),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Botón para regresar
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: amarilloSuave,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.arrow_back),
                label: const Text(
                  'Calcular otra carrera',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
