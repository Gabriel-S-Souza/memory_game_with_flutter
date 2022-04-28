import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memory_game/components/custom_app_bar.dart';
import 'package:memory_game/components/custom_background_painter.dart';
import 'package:memory_game/components/custom_main_buttom.dart';
import 'package:memory_game/components/custom_menu.dart';
import 'package:memory_game/default_values/game_themes.dart';
import 'package:memory_game/models/game_model.dart';

import '../models/game_menu_settings.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedTheme;
  String? selectedMode;
  int numberOfPairs = 8;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > MediaQuery.of(context).size.height) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    } else {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    }

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(
        height: (kToolbarHeight * 2.2) + MediaQuery.of(context).padding.top,
        // color: Colors.black12,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        alignment: Alignment.center,
        children: [
          CustomBackgroungImage(width: width),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                flex: 3,
                child: SizedBox(
                  width: width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomMenu(
                        width: MediaQuery.of(context).size.width * 0.38,
                        height: height * 0.072,
                        gameMenuSettings: GameMenuSettings(
                          options: const [GameThemes.animals, GameThemes.landscape, GameThemes.dev],
                          icons: const [Icons.pets, Icons.location_city, Icons.computer],
                          label: 'Tema',
                          onSelected: (selectedItem) {
                            selectedTheme = selectedItem;
                          },      
                        ) ,
                      ),
                      CustomMenu(
                        width: MediaQuery.of(context).size.width * 0.38,
                        height: height * 0.072,
                        gameMenuSettings: GameMenuSettings(
                          options: const ['Single', 'Multi'],
                          icons: const [Icons.person, Icons.people],
                          label: 'Modo',
                          onSelected: (selectedItem) {
                            selectedMode = selectedItem;
                          },      
                        ) ,
                      ),
                    ],
                  ),
                ),
              ),
              const Flexible(
                flex: 1,
                child: SizedBox()
              ),
              Flexible(
                flex: 1,
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                    width: width - (((width - (width * 0.78)) / 3) * 2),
                    ),
                  child: CustomMainButton(
                    onPressed: () {
                      if (selectedMode == 'Single') {
                        Navigator.pushNamed(context, '/singleplayer', arguments: GameModel(themeName: selectedTheme!, numberOfPairs: numberOfPairs));
                      } else if (selectedMode == 'Multi') {
                        Navigator.pushNamed(context, '/multiplayer', arguments: GameModel(themeName: selectedTheme!, numberOfPairs: numberOfPairs));
                      }
                    },
                  ),
                ),
              ),
              const Flexible(
                flex: 1,
                child: FractionallySizedBox(
                  heightFactor: 0.8,
                )
              ),
            ],
          ),
          Positioned(
            bottom: height * 0.015,
            child: RichText(
              text: TextSpan(
                text: 'Desenvolvedor: ',
                style: TextStyle(
                  fontSize: 8,
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontFamily: 'ConcertOne',
                ),
                children: const <TextSpan>[
                  TextSpan(
                    text: 'Gabriel-S-Souza',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    )
                  ),
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}
