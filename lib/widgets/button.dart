import 'package:flutter/material.dart';

class CaluButton extends StatefulWidget {
  String text;
  Color? bColor;
  Color? textColor;
  final onTap;
  CaluButton(
      {super.key, required this.text, this.bColor, this.onTap, this.textColor});

  @override
  State<CaluButton> createState() => _CaluButtonState();
}

class _CaluButtonState extends State<CaluButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      splashColor: Colors.deepPurple,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.all(7),
        width: 25,
        height: 25,
        decoration: BoxDecoration(
            color: widget.bColor, borderRadius: BorderRadius.circular(12)),
        child: InkWell(
          child: Center(
              child: Text(
            widget.text,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: widget.textColor),
          )),
        ),
      ),
    );
  }
}
