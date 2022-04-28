import 'package:flutter/material.dart';

class ModalPage extends PageRoute {
  final WidgetBuilder builder;
  final Color? myBarrierColor;
  final Duration duration;
  final bool autoDispose;
  final bool myBarrierDismissible;
  // ignore: annotate_overrides, overridden_fields
  final bool fullscreenDialog;
  final bool bottomSlideTransiction;
  ModalPage({
    RouteSettings? settings,
    this.myBarrierColor = Colors.transparent,
    this.duration = const Duration(milliseconds: 850),
    this.autoDispose = false,
    this.myBarrierDismissible = true,
    this.fullscreenDialog = true,
    required this.builder,
    this.bottomSlideTransiction = true
  })
      : super(settings: settings, fullscreenDialog: fullscreenDialog);

  @override
  Color? get barrierColor => myBarrierColor;

  @override
  String? get barrierLabel => 'Modal';

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation) {
      if (autoDispose) {
        Future.delayed(const Duration(milliseconds: 1850), () {
          Navigator.of(context).pop();
        });
      }
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
  Duration get transitionDuration => duration;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => myBarrierDismissible;

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
            begin: 1,
            end: 1.45,
          ).animate(
            CurvedAnimation(
            parent: animation,
            curve: Curves.decelerate,
          ),
          ),
        ),
        opacity: animation,
      );
    }
  }
}