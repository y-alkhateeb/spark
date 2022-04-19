import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

/// for auto route
typedef AnimatedRouteBuilder = Route<T> Function<T>(
    BuildContext context, Widget child, CustomPage page);


Route<T> myAnimatedRouteBuilder<T>(BuildContext context, Widget child, CustomPage<T> page){

  return AnimatedPage(
      fullscreenDialog: page.fullscreenDialog,
      // this is important
      settings: page,
      pageBuilder: (context, animation, secondaryAnimation) => ListenableProvider(
        create: (context) => animation,
        child: child,
      )
  );
}

class AnimatedPage<T> extends PageRoute<T>{
  final RoutePageBuilder pageBuilder;
  final PageTransitionsBuilder matchingBuilder = const CupertinoPageTransitionsBuilder(); // Default iOS/macOS (to get the swipe right to go back gesture)
  // final PageTransitionsBuilder matchingBuilder = const FadeUpwardsPageTransitionsBuilder(); // Default Android/Linux/Windows

  AnimatedPage({
    RouteSettings? settings,
    required this.pageBuilder,
    this.transitionDuration = const Duration(milliseconds: 600),
    this.reverseTransitionDuration = const Duration(milliseconds: 600),
    bool fullscreenDialog = false,
  }) :
        super(settings: settings, fullscreenDialog: fullscreenDialog);

  @override
  final Duration reverseTransitionDuration;

  @override
  Color? get barrierColor => null;

  @override
  bool get opaque => true;

  @override
  bool get barrierDismissible => false;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return pageBuilder(context, animation, secondaryAnimation);
  }

  @override
  bool get maintainState => true;

  @override
  final Duration transitionDuration;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return matchingBuilder.buildTransitions<T>(this, context, animation, secondaryAnimation, child);
  }

}

class SlidingAnimated extends StatelessWidget {
  final double initialOffsetX;
  final double intervalStart;
  final double intervalEnd;
  final Widget child;

  const SlidingAnimated({
    Key? key,
    required this.initialOffsetX,
    required this.intervalStart,
    required this.intervalEnd,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animation = Provider.of<Animation<double>>(context, listen: false);

    return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(initialOffsetX, 0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                curve: Interval(
                  intervalStart,
                  intervalEnd,
                  curve: Curves.easeInCirc,
                ),
                parent: animation,
              ),
            ),
            child: child,
          );
        },
        child: child,
    );
  }
}


class SlidingUpAnimated extends StatelessWidget {
  final double initialOffsetY;
  final double intervalStart;
  final double intervalEnd;
  final Widget child;

  const SlidingUpAnimated({
    Key? key,
    required this.initialOffsetY,
    required this.intervalStart,
    required this.intervalEnd,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animation = Provider.of<Animation<double>>(context, listen: false);

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, initialOffsetY),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              curve: Interval(
                intervalStart,
                intervalEnd,
                curve: Curves.easeInCirc,
              ),
              parent: animation,
            ),
          ),
          child: child,
        );
      },
      child: child,
    );
  }
}

class FadeAnimated extends StatelessWidget {
  final double intervalStart;
  final double intervalEnd;
  final Widget child;

  const FadeAnimated({
    Key? key,
    required this.intervalStart,
    required this.intervalEnd,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animation = Provider.of<Animation<double>>(context, listen: false);

    return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return FadeTransition(
            child: child,
            opacity: Tween<double>(
              begin: 0,
              end: 1,
            ).animate(
              CurvedAnimation(
                curve: Interval(
                  intervalStart,
                  intervalEnd,
                  curve: Curves.bounceInOut,
                ),
                parent: animation,
              ),
            ),
          );
        },
        child: child
    );
  }
}