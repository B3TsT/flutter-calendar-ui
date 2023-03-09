import 'package:flutter/material.dart';

class LocalHours extends StatelessWidget {
  const LocalHours({
    super.key,
    required this.formattedDate,
    required this.month,
  });

  final String formattedDate;
  final String month;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            formattedDate,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.19,
                color: const Color(0xff3C3C3C),
                fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(
          child: Text(
            month.substring(0, 3).toUpperCase(),
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.19,
                color: const Color(0xff3C3C3C),
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
