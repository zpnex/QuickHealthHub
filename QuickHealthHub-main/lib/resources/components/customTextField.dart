import 'package:flutter/material.dart';
import 'package:sampleapp/consts/colors.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController? textController;
  final Color textColor;
  final Color boaderColor;
  final Color inputColor;
  final bool isPassword;
  const CustomTextField(
      {super.key,
      required this.hint,
      this.textController,
      this.textColor = Colors.black,
      this.boaderColor = Colors.black,
      this.inputColor = Colors.black,
      this.isPassword = false});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textController,
      cursorColor: AppColors.blueColor,
      style: TextStyle(color: widget.inputColor),
      obscureText: widget.isPassword,
      decoration: InputDecoration(
          isDense: true,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.boaderColor)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.boaderColor)),
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: widget.boaderColor,
          )),
          hintText: widget.hint,
          hintStyle: TextStyle(
            color: widget.textColor,
          )),
    );
  }
}
