import 'package:flutter/material.dart';

class ModalPage extends PageRoute {
  final WidgetBuilder builder;
  // ignore: annotate_overrides, overridden_fields
  late final bool fullscreenDialog;
  final bool bottomSlideTransiction;
  ModalPage({
    RouteSettings? settings,
    this.fullscreenDialog = true,
    required this.builder,
    this.bottomSlideTransiction = true
  })
      : super(settings: settings, fullscreenDialog: fullscreenDialog);

  @override
  Color? get barrierColor => Colors.transparent;

  @override
  String? get barrierLabel => 'Modal';

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Stack(
      alignment: Alignment.center,
      children: [
        builder(context),
      ],
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 850);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (bottomSlideTransiction) {
      return SlideTransition(
        child: child,
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOutBack,
          ),
        ),
      );
    } else {
      return FadeTransition(
        child: ScaleTransition(
          child: child,
          scale: Tween<double>(
            begin: 0.4,
            end: 1.45,
          ).animate(animation),
        ),
        opacity: animation,
      );
    }
  }
}