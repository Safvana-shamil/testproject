import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget(
      {Key? key,
      required this.child,
      required this.backGroundColor,
      required this.padding,
      required this.borderRadius,
      required this.borderColor, required this.onPressed})
      : super(key: key);
  final Widget child;
  final Color backGroundColor;
  final Color borderColor;
  final double padding;
  final double borderRadius;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
      style: ElevatedButton.styleFrom(
        side: BorderSide(width: 1, color: borderColor),
        backgroundColor: backGroundColor,
        padding: EdgeInsets.all(padding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
