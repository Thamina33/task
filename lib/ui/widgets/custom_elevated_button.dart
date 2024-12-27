import 'package:flutter/material.dart';

class CustomElevatedButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final double? buttonHeight;
  final double? buttonWidth;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? buttonBorderColor;
  final double? borderRadius;
  final double? borderSide;
  final double? elevation;
  final bool isLoading;

  const CustomElevatedButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.buttonHeight,
      this.buttonWidth,
      this.backgroundColor = Colors.black,
      this.textColor = Colors.white,
      this.buttonBorderColor,
      this.borderRadius = 8.0,
      this.borderSide,
      this.elevation = 4,
      this.isLoading = false});

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.buttonHeight ?? 40.0,
      width: widget.buttonWidth ?? MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: widget.textColor,
          backgroundColor: widget.backgroundColor,
          side: BorderSide(
            color: widget.buttonBorderColor ?? Colors.transparent,
            width: widget.borderSide ?? 0.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0),
          ),
          elevation: widget.elevation,
        ),
        onPressed: widget.onPressed,
        child: widget.isLoading
            ? const SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 3,
                ),
              )
            : Text(
                widget.text,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
      ),
    );
  }
}
