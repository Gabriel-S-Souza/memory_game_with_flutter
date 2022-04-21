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
      color: Theme.of(context).colorScheme.onBackground,
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.85,
      child: Center(
        child: Column(
          children: const [
            Text(
              'Você ganhou!!!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}