import 'package:flutter/material.dart';

import 'custom_player_card.dart';

class CustomPlayerCardToMultplayer extends StatelessWidget {
  final double padding;
  const CustomPlayerCardToMultplayer({ Key? key, required this.padding }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: CustomPlayerCard(
              name: 'Player 1',
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.38,
              playerNumber: 1,
            ),
          ),
          Expanded(
            flex: 1,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: height * 0.015,
                  color: Theme.of(context).colorScheme.tertiary,
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
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: CustomPlayerCard(
              name: 'Player 2',
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.38,
              playerNumber: 2,
            ),
          ),
        ],
      ),
    );
  }
}