class FechasModel {
  FechasModel({
    required this.fechas,
  });

  final List<Fecha> fechas;
}

class Fecha {
  Fecha({
    required this.dia,
    required this.mes,
    required this.ao,
  });

  final int dia;
  final int mes;
  final int ao;
}
