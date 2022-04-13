import 'package:flutter/material.dart';

class CustomPlayerCard extends StatefulWidget {
  final String name;
  const CustomPlayerCard({Key? key, required this.name}) : super(key: key);

  @override
  State<CustomPlayerCard> createState() => _CustomPlayerCardState();
}

class _CustomPlayerCardState extends State<CustomPlayerCard> {
  int victoriesNumber = 0;
  int currentRoundNumber = 1;
  int numberOfRounds = 8;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      width: 164,
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Expanded(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.name),
                SizedBox(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$victoriesNumber'),
                    Icon(
                      Icons.emoji_events,
                      size: 16,
                      color: Theme.of(context).colorScheme.surface,
                    )
                  ],
                ))
              ],
            ),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Text(
                  '$currentRoundNumber/$numberOfRounds',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.shadow,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
