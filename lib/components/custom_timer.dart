import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:memory_game/controllers/game_controller.dart';
import 'package:memory_game/models/record_model.dart';
import 'package:memory_game/repositories/record_time_repository.dart';

class CustomTimer extends StatefulWidget {
  final double width;
  final double height;
  final String themeName;
  const CustomTimer({Key? key, required this.width, required this.height, required this.themeName})
      : super(key: key);

  @override
  State<CustomTimer> createState() => _CustomTimerState();
}

class _CustomTimerState extends State<CustomTimer> {
  String timeString = '00:00';
  int secondsCounter = 0;
  late Box<RecordModel> recordBox;
  String? recordString;
  int? recordSeconds;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    _getTimer();
    recordBox = RecordTimeRepository.getRecordTime();
    recordString = recordBox.get(widget.themeName)?.timeString;
    recordSeconds = recordBox.get(widget.themeName)?.timeInSeconds;
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void resetTimer() {
    setState(() {
      secondsCounter = 0;
      timeString = '00:00';
      timer.cancel();
      _getTimer();
      recordString = recordBox.get(widget.themeName)?.timeString;
      recordSeconds = recordBox.get(widget.themeName)?.timeInSeconds;
    });
  }

  @override
  Widget build(BuildContext context) {
    final gameController = GameController.of(context);
    gameController?.time = timeString;
    gameController?.timeInSeconds = secondsCounter;
    if (gameController?.notifier?.value == 0 && gameController!.victorys != 0) {
      resetTimer();
    }

    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Transform.translate(
        offset: Offset(widget.width / 6, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Flexible(
                    child: FractionallySizedBox(
                  widthFactor: 0.44,
                )),
                RichText(
                  text: TextSpan(
                    text: 'Record: ',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'ConcertOne',
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.8),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: recordString,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          )),
                    ],
                  ),
                ),
              ],
            ),
            RichText(
              text: TextSpan(
                text: 'Timer: ',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'ConcertOne',
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.8),
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
      ),
    );
  }

  void _getTimer() {
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
}
