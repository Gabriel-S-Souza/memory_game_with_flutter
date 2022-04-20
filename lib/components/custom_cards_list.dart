import 'package:flutter/material.dart';
import 'package:memory_game/components/custom_card.dart';
import 'package:memory_game/controller/game_controller.dart';
import 'package:memory_game/models/game_model.dart';

class CustomCardsList extends StatefulWidget {
  final GameModel gameModel;
  const CustomCardsList({Key? key, required this.gameModel}) : super(key: key);

  @override
  State<CustomCardsList> createState() => _CustomCardsListState();
}

class _CustomCardsListState extends State<CustomCardsList> {
  late final GameModel _gameModel = widget.gameModel;
  List<String>? _shuffledImagePaths;
  List<Map<String, dynamic>> matchedCards = [];

  @override
  void initState() {
    super.initState();
    _shuffledImagePaths = _shuffleImagePaths(_gameModel.getImagesPath());
  }

  List<String> _shuffleImagePaths(List<String> imagePaths) {
    imagePaths.shuffle();
    return imagePaths;
  }

  @override
  Widget build(BuildContext context) {
    final gameController = GameController.of(context);

    return GridView.count(
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,
      crossAxisCount: 4,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1 / 1.25,
      children: List.generate(16, (index) {
        return CustomCard(
            pathImage: _shuffledImagePaths![index],
            index: index,
            onTap: (path, index) {
              if (matchedCards.isEmpty) {
                matchedCards.add({'path': path, 'index': index});
              } else if (matchedCards.length == 1) {
                matchedCards.add({'path': path, 'index': index});
                gameController!.validateMatch(matchedCards);
                matchedCards = [];
              }
            },
            isMatched: gameController!.matchedCards.contains(index));
      }),
    );
  }
}
