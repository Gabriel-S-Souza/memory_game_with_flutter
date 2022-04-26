import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class CustomModal extends StatefulWidget {
  final Widget child;
  final String title;
  final String? subtitle;
  final String? secondSubtitle;
  final bool singleplayer;
  final bool showConffetti;
  const CustomModal({
    Key? key,
    required this.child,
    required this.title,
    this.subtitle,
    this.secondSubtitle,
    this.singleplayer = true,
    this.showConffetti = false,
  }) : super(key: key);

  @override
  State<CustomModal> createState() => _CustomModalState();
}

class _CustomModalState extends State<CustomModal> {
  ConfettiController? confettiController;

  @override
  void initState() {
    super.initState();
    if (widget.showConffetti) {
      confettiController = ConfettiController();
      confettiController!.play();
      Future.delayed(const Duration(milliseconds: 600), () {
        confettiController!.stop();
      });
    }
  }

  @override
  void dispose() {
    confettiController?.dispose();
    super.dispose();
  }

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
          alignment: Alignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.1,
                bottom: MediaQuery.of(context).size.height * 0.01,
              ),
              child: getBodyModal(context),
            ),
            Positioned(
              top: -MediaQuery.of(context).size.height * 0.1,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                radius: MediaQuery.of(context).size.height * 0.1,
                child: widget.child,
              ),
            ),
            widget.showConffetti
                ? ConfettiWidget(
                  confettiController: confettiController!,
                  blastDirectionality: BlastDirectionality.explosive,
                  numberOfParticles: 20,
                  minBlastForce: 5,
                  gravity: 0.3,
                )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget getBodyModal(context) {
    if (widget.singleplayer) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            widget.title,
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
              widget.subtitle != null
                ? Text(
                    widget.subtitle ?? '',
                    style: TextStyle(
                      fontFamily: 'ConcertOne',
                      fontSize: 24,
                      color: Theme.of(context).colorScheme.onSurface,
                      decoration: TextDecoration.none,
                    ),
                  )
                : Container(),
            widget.subtitle != null ? const SizedBox(height: 10) : Container(),
            widget.secondSubtitle != null
              ? Text(
                  widget.secondSubtitle ?? '',
                  style: TextStyle(
                    fontFamily: 'ConcertOne',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: widget.showConffetti
                        ? Theme.of(context).colorScheme.surfaceVariant
                        : Theme.of(context).colorScheme.primary,
                    decoration: TextDecoration.none,
                  ),
                )
              : Container(),
            ],
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Container(
            child: Text('Multiplayer mode'),
          )
        ],
      );
    }
  }
}
