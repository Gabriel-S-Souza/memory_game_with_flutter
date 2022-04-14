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
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.4),
            blurRadius: 2,
            offset: const Offset(2, 2),
          ),
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.4),
            blurRadius: 8,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: Icon(
        Icons.question_mark,
        color: Theme.of(context).colorScheme.onPrimary,
        size: MediaQuery.of(context).size.width * 0.15,
      ),
    );
  }
}
