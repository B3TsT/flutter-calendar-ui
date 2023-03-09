import '../models/dates.dart';

List<DateTime> generateFechas() {
  List<DateTime> fechas = [];

  for (var i = DateTime(2010, 1, 1);
      i.compareTo(DateTime(2030, 12, 31)) <= 0;
      i = i.add(const Duration(days: 1))) {
    fechas.add(i);
  }

  return fechas;
}

List<FechasModel> generateFechasModel(List<DateTime> fechas) {
  List<FechasModel> fechasModel = [];

  for (var fecha in fechas) {
    final fechaModel = FechasModel(
        fechas: [Fecha(dia: fecha.day, mes: fecha.month, ao: fecha.year)]);
    fechasModel.add(fechaModel);
  }

  return fechasModel;
}
