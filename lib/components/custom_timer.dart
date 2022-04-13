import 'dart:async';

import 'package:flutter/material.dart';

class CustomTimer extends StatefulWidget {
  final double width;
  final double height;
  final String record;
  const CustomTimer(
      {Key? key,
      required this.width,
      required this.height,
      required this.record})
      : super(key: key);

  @override
  State<CustomTimer> createState() => _CustomTimerState();
}

class _CustomTimerState extends State<CustomTimer> {
  String? timer = '00:00';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          RichText(
            textAlign: TextAlign.right,
            text: TextSpan(
              text: 'Record: ',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'ConcertOne',
                color: Theme.of(context).colorScheme.secondary,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: widget.record,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
              ],
            ),
          ),
          RichText(
            textAlign: TextAlign.right,
            text: TextSpan(
              text: 'Timer: ',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'ConcertOne',
                color: Theme.of(context).colorScheme.secondary,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: timer,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _getTimer() {
    int segundos = 0;
    int minutos = 0;
    int hours = 0;

    Timer.periodic(const Duration(seconds: 1), (timer) {
      segundos++;
      if (segundos == 60) {
        segundos = 0;
        minutos++;
      }
      if (minutos == 60) {
        minutos = 0;
        hours++;
      }
    });
    setState(() {
      timer = '${hours > 0 ? hours : ''}:$minutos:$segundos';
    });
  }
}
