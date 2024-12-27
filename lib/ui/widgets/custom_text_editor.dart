import 'package:flutter/material.dart';

class CustomTextEditor extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final TextInputType keyboardType;
  final IconData? icon;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final bool isPass;
  final bool isActive;

  const CustomTextEditor(
      {super.key,
      required this.controller,
      this.hintText = '',
      this.maxLines = 1,
      this.keyboardType = TextInputType.text,
      this.icon,
      this.validator,
      this.textInputAction = TextInputAction.next,
      this.isPass = false,
      this.isActive = true});

  @override
  State<CustomTextEditor> createState() => _CustomTextEditorState();
}

class _CustomTextEditorState extends State<CustomTextEditor> {
  var _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.isActive,
      controller: widget.controller,
      maxLines: widget.maxLines,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      style: const TextStyle(
          fontWeight: FontWeight.w400, fontSize: 12, color: Colors.black),
      decoration: InputDecoration(
        isDense: true,
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
        suffixIcon: widget.isPass
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
                child: Icon(
                  _showPassword ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
        hintStyle: const TextStyle(
            fontWeight: FontWeight.w400, fontSize: 12, color: Colors.blueGrey),
      ),
      validator: widget.validator,
      obscureText: widget.isPass ? _showPassword : false,
    );
  }
}
