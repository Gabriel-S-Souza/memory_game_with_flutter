import 'dart:math';

import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final String pathImage;
  const CustomCard({Key? key, required this.pathImage}) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animation;

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  void _flipCard() {
    _animation.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, _) {
        final double angle = _animation.value * pi;
        final transform = Matrix4.identity()
          ..setEntry(3, 2, 0.0025)
          ..rotateY(angle);

        return GestureDetector(
          onTap: _flipCard,
          child: Transform(
            transform: transform,
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                // color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color:
                        Theme.of(context).colorScheme.shadow.withOpacity(0.4),
                    blurRadius: 2,
                    offset: const Offset(2, 2),
                  ),
                  BoxShadow(
                    color:
                        Theme.of(context).colorScheme.shadow.withOpacity(0.4),
                    blurRadius: 8,
                    offset: const Offset(4, 4),
                  ),
                ],
                gradient: LinearGradient(
                  stops: const [0.0, 1],
                  transform: const GradientRotation(20),
                  colors: (angle < 0.5 * pi) ? [
                    Theme.of(context).colorScheme.onSurface,
                    Theme.of(context).colorScheme.secondary,
                  ] : [
                    Theme.of(context).colorScheme.primaryContainer,
                    Theme.of(context).colorScheme.primaryContainer,
                  ],
                ),
              ),
              child: _getChild(angle),
            ),
          ),
        );
      },
    );
  }

  Widget _getChild(double angle) {
    if (angle < 0.5 * pi) {
      return Icon(
        Icons.question_mark,
        color: Theme.of(context).colorScheme.onPrimary,
        size: MediaQuery.of(context).size.width * 0.15,
      );
    } else {
      return _getBackCard();
    }
  }

  Widget _getBackCard() {
    return Image.asset(widget.pathImage);
  }
}
