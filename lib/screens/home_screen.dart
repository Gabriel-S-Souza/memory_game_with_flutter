import 'package:flutter/material.dart';
import 'package:memory_game/components/custom_app_bar.dart';
import 'package:memory_game/components/custom_background_painter.dart';
import 'package:memory_game/components/custom_menu.dart';


class HomeScreen extends StatelessWidget {

  const HomeScreen({ Key? key }) : super(key: key);

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
        children: [
          CustomBackgroungImage(width: width),
          Container(
            margin: EdgeInsets.only(top: height / 3.6),
            child: Container(
              width: width,
              padding: EdgeInsets.only(left: width * 0.025, right: width * 0.025),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  CustomMenu(
                    options: ['Dev', 'Animais', 'Turismo'],
                    icons: [Icons.computer, Icons.pets, Icons.location_city],
                    label: 'Tema',
                  ),
                  CustomMenu(
                    options: ['Single', 'Multi'],
                    icons: [Icons.person, Icons.people],
                    label: 'Modo',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

