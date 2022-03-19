import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextButton extends StatelessWidget {
  MyTextButton.primary({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isSecondary = false,
    this.width,
  }) : super(key: key);

  MyTextButton.secondary({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isSecondary = true,
    this.width,
  }) : super(key: key);

  final String text;
  final VoidCallback? onPressed;
  final double? width;

  /// The button's background fill color.
  final bool isSecondary;

  @override
  Widget build(BuildContext context) {
    return BouncingWidget(
      child: SizedBox(
        width: width ?? 350.w,
        child: TextButton(
          style: isSecondary
              ? Theme.of(context).textButtonTheme.style!.copyWith(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                  )
              : Theme.of(context).textButtonTheme.style,
          child: Text(
            text,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: isSecondary
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onPrimary,
                ),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}

class BouncingWidget extends StatefulWidget {
  final Widget child;

  const BouncingWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<BouncingWidget> createState() => _BouncingWidgetState();
}

class _BouncingWidgetState extends State<BouncingWidget>
    with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 100,
      ),
      lowerBound: 0.0,
      upperBound: 0.03,
    )..drive(CurveTween(curve: Curves.elasticIn));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _tapDown,
      onTapUp: _tapUp,
      onTapCancel: (){
        _controller.reverse();
        },
      child: AnimatedBuilder(
        animation: _controller,
        child: widget.child,
        builder: (_, child) {
          _scale = 1 - _controller.value;
          return Transform.scale(
            scale: _scale,
            child: child,
          );
        }
      ),
    );
  }

  void _tapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _tapUp(TapUpDetails details) {
    _controller.reverse();
  }
}
