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
        top: height/2.2
      ),
      height: height,
      color: color,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.032),
            child: Image.asset(
              'assets/images/man-thinking.png',
              height: height / 2.8,
              fit: BoxFit.fitHeight,
            ),
          ),
          VerticalDivider(
            color: Theme.of(context).colorScheme.shadow,
            thickness: 2,
            indent: height * 0.14,
            endIndent: height * 0.06,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            padding: EdgeInsets.only(
              left: 12, 
              bottom: height * 0.132,
            ),
            child: Text(
              'Memory Game',
              style: TextStyle(
                fontSize: 38,
                height: 1.124,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}