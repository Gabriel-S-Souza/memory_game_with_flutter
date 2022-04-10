import 'package:flutter/material.dart';
import 'package:memory_game/components/custom_app_bar.dart';
import 'package:memory_game/components/custom_background_painter.dart';


class HomeScreen extends StatelessWidget {

  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(
        height: (kToolbarHeight * 2.2) + MediaQuery.of(context).padding.top,
        // color: Colors.black12,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          CustomBackgroungImage(width: width)
        ],
      ),
    );
  }
}

