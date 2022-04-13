import 'package:flutter/material.dart';

class CustomPlayerCard extends StatelessWidget {
  final double width;
  final double height;
  final String name;
  final int score;
  final int victoriesNumber;
  final int totalOfPairs;

  const CustomPlayerCard({
      Key? key,
      required this.name,
      required this.width,
      required this.height,
      required this.score, 
      required this.victoriesNumber, 
      required this.totalOfPairs
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(top: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$victoriesNumber',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.6),
                        ),
                      ),
                      Icon(
                        Icons.emoji_events,
                        size: 20,
                        color: Theme.of(context).colorScheme.surface,
                      )
                    ],
                  ))
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: height * 0.06),
            height: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$score/$totalOfPairs',
                  style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.6),
                  ),
                ),
                SizedBox(
                  height: 6,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: LinearProgressIndicator(
                      value: score / 8,
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.1),
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).colorScheme.surfaceVariant),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}