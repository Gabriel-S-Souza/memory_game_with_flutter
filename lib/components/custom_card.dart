import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({Key? key}) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.secondary,
      child: Icon(
        Icons.question_mark,
        color: Theme.of(context).colorScheme.onPrimary,
        size: MediaQuery.of(context).size.width * 0.15,
      ),
    );
  }
}
