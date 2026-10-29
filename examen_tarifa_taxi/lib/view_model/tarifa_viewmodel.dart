import 'package:flutter/material.dart';
import '../model/tarifa_modelo.dart';

class TarifaViewModel extends ChangeNotifier {
  // Estado: Horario seleccionado (por defecto 'Día')
  String horarioSeleccionado = 'Día';

  // Cambiar horario y notificar a las vistas que escuchan
  void seleccionarHorario(String nuevoHorario) {
    horarioSeleccionado = nuevoHorario;
    notifyListeners();
  }

  // Método para calcular la tarifa
  TarifaModelo calcularTarifa(double kilometros) {
    const double tarifaBase = 1.50;
    const double costoPorKm = 0.60;

    // Costo del recorrido: Tarifa base + ($0.60 * km)
    double costoRecorrido = tarifaBase + (kilometros * costoPorKm);

    // Recargo: 20% sobre el costo de la carrera si es horario nocturno
    double recargo = 0.0;
    if (horarioSeleccionado == 'Noche') {
      recargo = costoRecorrido * 0.20;
    }

    // Total a pagar
    double total = costoRecorrido + recargo;

    return TarifaModelo(
      kilometros: kilometros,
      horario: horarioSeleccionado,
      costoRecorrido: costoRecorrido,
      recargo: recargo,
      total: total,
    );
  }
}

