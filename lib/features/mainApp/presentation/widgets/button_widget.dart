import 'package:flutter/material.dart';

///reusable button widget
class ButtonWidget extends StatelessWidget {
  ///default constructor
  const ButtonWidget(
      {required this.buttonTitle,
      required this.bgColor,
      required this.ontap,
      super.key});

  ///title for button
  final String buttonTitle;

  ///background color
  final Color bgColor;

  ///function when button is tapped/pressed
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: ontap,
        child: Text(
          buttonTitle,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
}
