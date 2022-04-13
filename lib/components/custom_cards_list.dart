import 'package:flutter/material.dart';
import 'package:memory_game/components/custom_card.dart';

class CustomCardsList extends StatefulWidget {
  const CustomCardsList({Key? key}) : super(key: key);

  @override
  State<CustomCardsList> createState() => _CustomCardsListState();
}

class _CustomCardsListState extends State<CustomCardsList> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomCard(
            height: height * 0.12, 
            width: width * 0.18,
          ),
          CustomCard(
            height: height * 0.12, 
            width: width * 0.18,
          ),
          CustomCard(
            height: height * 0.12, 
            width: width * 0.18,
          ),
          CustomCard(
            height: height * 0.12, 
            width: width * 0.18,
          ),
        ],
      ),
    );
  }
}
