import 'package:flutter/material.dart';

import 'circle_button.dart';

class MyLeading extends StatelessWidget {
  const MyLeading({
    super.key,
    required this.inButtonPressed,
  });

  final bool inButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 130),
                  child: CircleButton(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 55,
                    color: const Color(0xffE5E6E1),
                    text: 'Today',
                    inButtonPressed: inButtonPressed,
                    controller: 1,
                  ),
                ),
                const SizedBox(width: 10),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 130),
                  child: CircleButton(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 55,
                    color: const Color(0xffE5E6E1),
                    text: 'Calendar',
                    inButtonPressed: inButtonPressed,
                    controller: 2,
                  ),
                ),
                const Spacer(),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 55),
                  child: CircleButton(
                    width: MediaQuery.of(context).size.width * 0.15,
                    height: 55,
                    color: const Color(0xffCDCEC9),
                    size: 24,
                    border: false,
                    text: '+',
                    inButtonPressed: inButtonPressed,
                    controller: 3,
                  ),
                )
              ],
            ),
          ),
        ),
        // Spacer(),
      ],
    );
  }
}
