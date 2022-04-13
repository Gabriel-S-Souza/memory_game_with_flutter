import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final double height;
  final double width;
  const CustomCard({Key? key, required this.height, required this.width}) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      padding: EdgeInsets.symmetric(
        horizontal: widget.width * 0.25,
        vertical: widget.height * 0.092,
      ),
      color: Theme.of(context).colorScheme.secondary,
      child: Text(
        '?',
        style: TextStyle(
          fontSize: 62,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
