import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class TimeZoneHelper {
  late tz.Location newYork;
  late tz.TZDateTime nowInNewYork;
  late tz.Location london;
  late tz.TZDateTime nowInLondon;

  TimeZoneHelper() {
    tz.initializeTimeZones();
    newYork = tz.getLocation('America/New_York');
    london = tz.getLocation('Europe/Paris');
    final myLocation = tz.local;
    final now = tz.TZDateTime.now(myLocation);
    nowInNewYork = tz.TZDateTime.from(now, newYork);
    nowInLondon = tz.TZDateTime.from(now, london);
  }
}

String getAmPm(tz.TZDateTime dateTime) {
  final hour = dateTime.hour;
  final suffix = hour >= 12 ? 'PM' : 'AM';
  return suffix;
}
