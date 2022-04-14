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

    return GridView.count(
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,
      crossAxisCount: 4,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1/1.25,
      children: List.generate(16, (index) {
        return const CustomCard(pathImage: 'assets/images/dev_theme/flutter.png',);
      }),
    );
  }
}
