import 'package:flutter/material.dart';
import 'package:memory_game/components/custom_card.dart';
import 'package:memory_game/models/game_model.dart';

import '../models/game_theme.dart';

class CustomCardsList extends StatefulWidget {
  final GameTheme gameTheme;
  const CustomCardsList({Key? key, required this.gameTheme}) : super(key: key);

  @override
  State<CustomCardsList> createState() => _CustomCardsListState();
}

class _CustomCardsListState extends State<CustomCardsList> {
  late final GameModel _gameModel;
  late final List<String> _shuffledImagePaths;
  List<String> currentIdsCard = [];

  @override
  void initState() {
    super.initState();
    _gameModel = GameModel(
      themeName: widget.gameTheme.themeName,
      numberOfPairs: 8,
    );
    _shuffledImagePaths = _shuffleImagePaths(_gameModel.getImagesPath());
  }

  //TODO: Refatorar lógica do shuffle para acontecer toda vez que a partida for iniciada
  List<String> _shuffleImagePaths(List<String> imagePaths) {
    imagePaths.shuffle();
    return imagePaths;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,
      crossAxisCount: 4,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1 / 1.25,
      children: List.generate(16, (index) {
        return CustomCard(pathImage: _shuffledImagePaths[index], index: index,);
      }),
    );
  }
}
