import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import '../util/variables.dart' as va;
import '../service/timezone.dart';
import '../widgets/leading.dart';
import '../widgets/view_calendar.dart';

class CalendarUi extends StatefulWidget {
  const CalendarUi({super.key});

  @override
  State<CalendarUi> createState() => _CalendartUiState();
}

class _CalendartUiState extends State<CalendarUi> {
  @override
  void initState() {
    super.initState();
    va.dateTime = DateTime.now();
    va.timeZone = TimeZoneHelper();
    va.nowInNewYork = va.timeZone.nowInNewYork;
    va.nowInLondon = va.timeZone.nowInLondon;
    va.timer =
        Timer.periodic(const Duration(minutes: 1), (timer) => updateTime());
  }

  @override
  void dispose() {
    va.timer?.cancel();
    super.dispose();
  }

  void updateTime() {
    setState(() {
      va.dateTime = DateTime.now();
      va.nowInNewYork = TimeZoneHelper().nowInNewYork;
      va.nowInLondon = TimeZoneHelper().nowInLondon;
      // getAmPmNew = getAmPm(nowInNewYork);
      // getAmPmNewLon = getAmPm(nowInLondon);
      // print(getAmPm(nowInNewYork));
    });
  }

  void buttonPressed() {
    setState(() {
      if (va.inButtonPressed == false) {
        va.inButtonPressed = true;
      } else if (va.inButtonPressed == true) {
        va.inButtonPressed == false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E6E1),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarBrightness: Brightness.light),
              backgroundColor: Colors.transparent,
              elevation: 0,
              leadingWidth: double.infinity,
              toolbarHeight: 120,
              leading: MyLeading(inButtonPressed: va.inButtonPressed),
              // expandedHeight: 120,
              // flexibleSpace: const FlexibleSpaceBar(),
              pinned: false,
              floating: true),
          // SliverList(
          //     delegate: SliverChildListDelegate([
          //   Column(
          //     children: const [ViewCalendar()],
          //   )
          // ])),
          const SliverToBoxAdapter(
            child: ViewCalendar(),
          ),
        ],
      ),
    );
  }
}
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffE5E6E1),
//       appBar: AppBar(
//         systemOverlayStyle:
//             const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leadingWidth: double.infinity,
//         toolbarHeight: 120,
//         leading: MyLeading(inButtonPressed: va.inButtonPressed),
//       ),
//       body: const ViewCalendar(),
//     );
//   }
// }
