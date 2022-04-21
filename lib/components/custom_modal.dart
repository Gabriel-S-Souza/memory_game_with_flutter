import 'package:flutter/material.dart';

class CustomModal extends StatelessWidget {
  final Widget child;
  final String title;
  final String? subtitle;
  final String? secondSubtitle;
  const CustomModal({
    Key? key, 
    required this.child, 
    required this.title, 
    this.subtitle, 
    this.secondSubtitle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.5),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.85,
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top:  MediaQuery.of(context).size.height * 0.1,
                bottom: MediaQuery.of(context).size.height * 0.01,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'ConcertOne',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Column(
                    children: [
                      subtitle != null ? Text(
                        subtitle ?? '',
                        style: TextStyle(
                          fontFamily: 'ConcertOne',
                          fontSize: 24,
                          color: Theme.of(context).colorScheme.onSurface,
                          decoration: TextDecoration.none,
                        ),
                      ) : Container(),
                      subtitle != null ? const SizedBox(height: 10) : Container(),
                      secondSubtitle != null ? Text(
                      secondSubtitle ?? '',
                      style: TextStyle(
                        fontFamily: 'ConcertOne',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                        decoration: TextDecoration.none,
                      ),
                    ) : Container(),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: - MediaQuery.of(context).size.height * 0.1,
              left: - MediaQuery.of(context).size.width * 0.02,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                radius: MediaQuery.of(context).size.height * 0.1,
                child: child,
              ),
            )
          ],
        ),
      ),
    );
  }
}