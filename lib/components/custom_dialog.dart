import 'package:flutter/material.dart';

// class CustomDialog extends StatelessWidget {
//   const CustomDialog({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       content: Stack(clipBehavior: Clip.none, children: [
//         Container(
//           height: MediaQuery.of(context).size.height * 0.25,
//           width: MediaQuery.of(context).size.width * 0.85,
//           child: Column(
//             children: [build(context)],
//           ),
//         )
//       ]),
//     );
//   }
// }

class ModalPage extends PageRoute {
  final WidgetBuilder builder;
  late final bool fullscreenDialog;
  ModalPage({
    RouteSettings? settings,
    this.fullscreenDialog = false,
    required this.builder,
  }) : super(settings: settings, fullscreenDialog: fullscreenDialog);

  @override
  // TODO: implement barrierColor
  Color? get barrierColor => Colors.transparent;

  @override
  // TODO: implement barrierLabel
  String? get barrierLabel => 'Modal';

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          color: Theme.of(context).colorScheme.onBackground,
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.85,
          child: Center(
            child: Column(
              children: [builder(context)],
            ),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement maintainState
  bool get maintainState => true;

  @override
  // TODO: implement transitionDuration
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Widget buildTransitions(
    BuildContext context, 
    Animation<double> animation, 
    Animation<double> secondaryAnimation, 
    Widget child) {
      return SlideTransition(
        child: child,
        position: Tween<Offset>(
        begin: Offset(0, 1),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: animation, 
          curve: Curves.easeInOutBack,
        ),
        
        ), 
      );
  }
}
