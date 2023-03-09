import 'package:flutter/material.dart';
import 'package:timezone/timezone.dart' as tz;

import '../service/timezone.dart';

class InternationalHours extends StatelessWidget {
  const InternationalHours({
    super.key,
    required this.nowInNewYork,
    required this.nowInLondon,
  });

  final tz.TZDateTime nowInNewYork;
  final tz.TZDateTime nowInLondon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.27,
      // color: Colors.amber,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          Text(
            '${nowInNewYork.hour}:${nowInNewYork.minute} ${getAmPm(nowInNewYork)}',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.19 / 3,
                fontWeight: FontWeight.w700),
            maxLines: 1,
          ),
          Text(
            'New York',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.15 / 3,
                fontWeight: FontWeight.w200),
          ),
          const SizedBox(height: 10),
          Text(
            '${nowInLondon.hour}:${nowInLondon.minute} ${getAmPm(nowInLondon)}',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.19 / 3,
                fontWeight: FontWeight.w700),
            maxLines: 1,
          ),
          Text(
            'Paris',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.15 / 3,
                fontWeight: FontWeight.w200),
          ),
        ],
      ),
    );
  }
}
