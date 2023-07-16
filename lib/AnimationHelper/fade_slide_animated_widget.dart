import 'package:flutter/material.dart';

enum SLIDE_Direction { LEFT, RIGHT, BOTTOM, TOP, NONE }

class FadeSlideAnimatedWidget extends StatelessWidget {
  const FadeSlideAnimatedWidget({
    Key? key,
    required this.controller,
    required this.widget,
    required this.direction,
    required this.slideValue,
  }) : super(key: key);

  final AnimationController controller;
  final Widget widget;
  final SLIDE_Direction direction;
  final double slideValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Opacity(
            opacity: controller.value,
            child: Container(
              margin: SLIDE_Direction.TOP == direction
                  ? EdgeInsets.only(
                      top: (slideValue - (slideValue * controller.value)),
                    )
                  : SLIDE_Direction.LEFT == direction
                      ? EdgeInsets.only(
                          left: (slideValue - (slideValue * controller.value)),
                        )
                      : SLIDE_Direction.RIGHT == direction
                          ? EdgeInsets.only(
                              right: (slideValue -
                                  (slideValue * controller.value)),
                            )
                          : SLIDE_Direction.BOTTOM == direction
                              ? EdgeInsets.only(
                                  bottom: (slideValue -
                                      (slideValue * controller.value)),
                                )
                              : EdgeInsets.all(0),
              child: child,
            ),
          );
        },
        child: widget,
      ),
    );
  }
}
