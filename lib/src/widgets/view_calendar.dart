import 'dart:math';

import 'package:flutter/material.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:intl/intl.dart';

import '../models/dates.dart';
import '../util/faker_tasks.dart';
import '../util/generate_dates.dart';
import '../util/variables.dart' as va;
import '../util/colors.dart' as co;
import 'circle_button.dart';
import 'international_hours.dart';
import 'local_hours.dart';

class ViewCalendar extends StatefulWidget {
  const ViewCalendar({super.key});

  // final String weekdayName;
  // final String formattedDate;
  // final String month;
  // final tz.TZDateTime nowInNewYork;
  // final tz.TZDateTime nowInLondon;
  // final List<FechasModel> fechasModel;

  @override
  State<ViewCalendar> createState() => _ViewCalendarState();
}

class _ViewCalendarState extends State<ViewCalendar> {
  @override
  void initState() {
    super.initState();
    va.tasks = obtenerData();
    va.fechas = generateFechas();
    va.fechasModel = generateFechasModel(va.fechas);
  }

  void changeIndex() {
    setState(() => co.index = co.random.nextInt(6));
  }

  @override
  Widget build(BuildContext context) {
    // padding: const EdgeInsets.only(top: 25),

    final color =
        Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        physics: const ClampingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              va.weekdayName,
              style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xff3C3C3C),
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.width * 0.4,
                    child: LocalHours(
                        formattedDate: va.formattedDate, month: va.month),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    width: 1,
                    height: MediaQuery.of(context).size.height * 0.13,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 20),
                  InternationalHours(
                      nowInNewYork: va.nowInNewYork,
                      nowInLondon: va.nowInLondon),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              decoration: const BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                  boxShadow: [BoxShadow(color: Colors.black38)]),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Todays tasks',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 140),
                          child: CircleButton(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 50,
                            color: const Color(0xfff6f6f6),
                            size: 16,
                            text: 'Reminders',
                            inButtonPressed: va.inButtonPressed,
                            controller: 2,
                            border: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: va.fechasModel.length,
                    itemBuilder: (_, int index) {
                      final fechas = va.fechasModel[index].fechas;
                      final fechaString = fechas.map((f) {
                        final DateTime fechaMes = DateTime(f.mes);
                        final String mesString =
                            DateFormat('MMMM').format(fechaMes);

                        return "${f.dia}/${mesString.substring(0, 3)}/${f.ao}";
                      }).join(", ");
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            width: double.infinity,
                            height:
                                MediaQuery.of(context).size.height * 0.4 / 2,
                            decoration: BoxDecoration(
                                color: co.colors[index % co.colors.length],
                                borderRadius: BorderRadius.circular(40)),
                            child: Text(fechaString)),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
