import 'package:flutter/material.dart';

import 'custom_player_card.dart';

class CustomPlayerCardToMultplayer extends StatelessWidget {
  const CustomPlayerCardToMultplayer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Positioned(
          top: height * 0.036,
          left: width / 3.28,
          child: Container(
            width: width * 0.30,
            height: width * 0.024,
            color: Theme.of(context).colorScheme.tertiary,
          )
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomPlayerCard(
              name: 'Player 1',
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.38,
            ),
            Container(
            width: width * 0.08,
            height: width * 0.08,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular((width * 0.08) * 0.5),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.shadow.withOpacity(0.2),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
                BoxShadow(
                  color: Theme.of(context).colorScheme.shadow.withOpacity(0.06),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ]
            ),
            child: Center(
              child: Text(
                'VS',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                    height: 0.5,
                  ),
              ),
            ),
          ),
            CustomPlayerCard(
              name: 'Player 2',
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.38,
            ),
          ],
        ),
      ],
    );
  }
}