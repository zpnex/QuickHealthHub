import 'package:flutter/material.dart';
import 'package:qhhub/consts/colors.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController? textController;
  final Color textColor;
  final Color boaderColor;
  const CustomTextField(
      {super.key,
      required this.hint,
      this.textController,
      this.textColor = Colors.black,this.boaderColor=Colors.black});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: widget.textController,
      cursorColor: AppColors.blueColor,
      decoration: InputDecoration(
        
        isDense: true,
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: widget.boaderColor)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: widget.boaderColor)),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.boaderColor,
            )

          ),
          hintText: widget.hint,
          hintStyle: TextStyle(
            color: widget.textColor,
          )),
    );
  }
}
