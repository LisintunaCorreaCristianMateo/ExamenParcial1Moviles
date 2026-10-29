import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_model/tarifa_viewmodel.dart';

class PrincipalPantalla extends StatefulWidget {
  const PrincipalPantalla({super.key});

  @override
  State<PrincipalPantalla> createState() => _PrincipalPantallaState();
}

class _PrincipalPantallaState extends State<PrincipalPantalla> {
  // Color amarillo estético suave
  static const Color amarilloSuave = Color(0xFFE6BA38);

  final TextEditingController _kmController = TextEditingController();

  @override
  void dispose() {
    _kmController.dispose();
    super.dispose();
  }

  void _procesarCalculo() {
    final km = double.tryParse(_kmController.text);

    if (km == null || km <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, ingresa una cantidad válida de kilómetros.'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    final vm = context.read<TarifaViewModel>();
    final resultado = vm.calcularTarifa(km);

    Navigator.pushNamed(
      context,
      '/resultado',
      arguments: resultado,
    );
  }

  void _limpiar() {
    _kmController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<TarifaViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Calcular Carrera'),
        backgroundColor: amarilloSuave,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),

            // Entrada de kilómetros
            TextField(
              controller: _kmController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Kilómetros recorridos',
            prefixIcon: const Icon(Icons.speed, color: amarilloSuave),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: amarilloSuave, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 25),

            // Selección de Horario
            const Text(
              'Horario del viaje:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),

            Card(
              color: Colors.white,
              elevation: 1.5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
                side: BorderSide(color: Colors.grey.shade200),
              ),
              child: RadioGroup<String>(
                groupValue: vm.horarioSeleccionado,
                onChanged: (valor) {
                  if (valor != null) {
                    context.read<TarifaViewModel>().seleccionarHorario(valor);
                  }
                },
                child: const Column(
                  children: [
                    RadioListTile<String>(
                      title: Text(
                        'Día',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      secondary: Icon(Icons.wb_sunny_outlined, color: amarilloSuave),
                      value: 'Día',
                    ),
                    Divider(height: 1),
                    RadioListTile<String>(
                      title: Text(
                        'Noche',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      secondary: Icon(Icons.nights_stay_outlined, color: Colors.blueGrey),
                      value: 'Noche',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 35),

            // Botón Calcular
            ElevatedButton(
              onPressed: _procesarCalculo,
              style: ElevatedButton.styleFrom(
                backgroundColor: amarilloSuave,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Calcular Valor a Pagar',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),

            // Botón Limpiar
            TextButton(
              onPressed: _limpiar,
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey.shade700,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('Limpiar campo'),
            ),
          ],
        ),
      ),
    );
  }
}
