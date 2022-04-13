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
  String timeString = '00:00';
  late Timer timer;

  @override
  void initState() {
    super.initState();
    _getTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          RichText(
            textAlign: TextAlign.right,
            text: TextSpan(
              text: 'Record: ',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'ConcertOne',
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
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
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
              ),
              children: <TextSpan>[
                TextSpan(
                  text: timeString,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.primary,
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
    int secondsCounter = 0;
    String time;

    if (mounted) {
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        secondsCounter += 1;
        setState(() {
          Duration duration = Duration(seconds: secondsCounter);
          String hours = formatTime(duration.inHours.remainder(60));
          String minutes = formatTime(duration.inMinutes.remainder(60));
          String seconds = formatTime(duration.inSeconds.remainder(60));
          time = '$hours:$minutes:$seconds';
          timeString =
              time.substring(0, 3).contains('00') ? time.substring(3, 8) : time;
        });
      });
    }
  }

  String formatTime(time) {
    return time >= 10 ? '$time' : '0$time';
  }

  // String _formatTime(int hours, int minutes, int seconds) {
  //   List<int> unitsTime = [hours, minutes, seconds];
  //   for (var i = 0; i < unitsTime.length ; i++) {

  //   }

  //   if (formattedTime.substring(0, 3).contains('00')) {
  //     return formattedTime.substring(3, 8);
  //   } else {
  //     return formattedTime.substring(0, 8);
  //   }
  // }
}
