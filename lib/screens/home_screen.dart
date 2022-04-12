import 'package:flutter/material.dart';
import 'package:memory_game/components/custom_app_bar.dart';
import 'package:memory_game/components/custom_background_painter.dart';
import 'package:memory_game/components/custom_main_buttom.dart';
import 'package:memory_game/components/custom_menu.dart';
import 'package:memory_game/models/game_theme.dart';

import '../models/game_menu_settings.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedTheme;
  String? selectedMode;

  @override
  Widget build(BuildContext context) {
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
          Padding(
            padding: EdgeInsets.only(top: height * 0.2),
            child: SizedBox(
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomMenu(
                    gameMenuSettings: GameMenuSettings(
                      options: const ['Dev', 'Animais', 'Turismo'],
                      icons: const [Icons.computer, Icons.pets, Icons.location_city],
                      label: 'Tema',
                      onSelected: (selectedItem) {
                        selectedTheme = selectedItem;
                      },      
                    ) ,
                  ),
                  CustomMenu(
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
          Positioned(
            bottom: width * 0.26,
            child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                  width: width - (((width - (width * 0.78)) / 3) * 2),
                ),
                child: CustomMainButton(
                  onPressed: () {
                    if (selectedMode == 'Single') {
                      Navigator.pushNamed(context, '/singleplayer', arguments: selectedTheme);
                    } else if (selectedMode == 'Multi') {
                      Navigator.pushNamed(context, '/multiplayer', arguments: GameTheme(selectedTheme!));
                    }
                  },
                )),
          ),
          Positioned(
            bottom: width * 0.026,
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
