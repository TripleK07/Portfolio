import 'package:flutter/material.dart';

class IconIndicator extends StatelessWidget {
  const IconIndicator({
    Key? key,
    required this.title,
    required this.size,
    required this.fillColor,
    required this.textColor,
  }) : super(key: key);

  final String title;
  final double size;
  final Color fillColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: fillColor,
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            this.title,
            style: TextStyle(
              color: textColor,
              fontSize: size,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
