import 'package:flutter/material.dart';
import 'package:flutter_cubit/theme/colors.dart';
import 'package:flutter_cubit/widgets/app_text.dart';

class AppButton extends StatefulWidget {
  
  final Color color;
  String? text;
  IconData? icon;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  bool? isIcon;

  AppButton({ Key? key, this.isIcon = false, required this.size, required this.color, this.text = "Hi", this.icon, required this.backgroundColor, required this.borderColor }) : super(key: key);

  @override
  _AppButtonState createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.borderColor,
          width: 1.0
        ),
        borderRadius: BorderRadius.circular(15),
        color: widget.backgroundColor
      ),
      child: widget.isIcon == false? AppText(text: widget.text!, color: widget.color) : Center(child: Icon(widget.icon, color: widget.color)),
    );
  }
}