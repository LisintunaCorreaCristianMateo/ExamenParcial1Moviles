class TarifaModelo {
  final double kilometros;
  final String horario; // "Día" o "Noche"
  final double costoRecorrido;
  final double recargo;
  final double total;

  TarifaModelo({
    required this.kilometros,
    required this.horario,
    required this.costoRecorrido,
    required this.recargo,
    required this.total,
  });
}

