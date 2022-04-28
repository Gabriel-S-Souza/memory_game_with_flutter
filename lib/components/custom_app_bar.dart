import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color color; 
  final double height;

  const CustomAppBar({ 
    Key? key,
    this.color = Colors.transparent, 
    required this.height, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.1, 
        top: height/3
      ),
      height: height,
      color: color,
      child: Row(
        children: [
          Image.asset(
            'assets/images/man-thinking.png',
            height: height / 2.32,
            fit: BoxFit.fitHeight,
          ),
          VerticalDivider(
            color: Theme.of(context).colorScheme.secondary.withAlpha(200),
            thickness: 2,
            indent: height * 0.12,
            endIndent: height * 0.12,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: height * 0.16, left: height * 0.015),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Memory',
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    fontSize: height * 0.24,
                    height: 1,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                 Text(
                   'Game',
                   overflow: TextOverflow.visible,
                   style: TextStyle(
                     fontSize: height * 0.24,
                     height: 1,
                     color: Theme.of(context).colorScheme.secondary,
                   ),
                 ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}