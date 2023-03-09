import 'dart:async';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart';
import '../util/days_of_week.dart';
import '../models/dates.dart';
import '../models/tasks.dart';
import '../service/timezone.dart';

late DateTime dateTime;
late TimeZoneHelper timeZone;
late TZDateTime nowInNewYork;
late String getAmPmNew;
late String getAmPmNewLon;
late TZDateTime nowInLondon;
late List<Task> tasks;
late List<DateTime> fechas;
late List<FechasModel> fechasModel;
bool inButtonPressed = false;
Timer? timer;

final DateFormat formatter = DateFormat('dd.yy');
// final DateFormat yearFormatter = DateFormat('YYYY');
final DateFormat monthFormatter = DateFormat('MMMM');
// final DateFormat timeFormatter = DateFormat('HH.mm');

String formattedDate = formatter.format(dateTime);
String month = monthFormatter.format(dateTime);
String weekdayName = daysOfWeek[dateTime.weekday - 1];
