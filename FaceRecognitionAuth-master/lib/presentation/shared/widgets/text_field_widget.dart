
import 'package:face_net_authentication/core/config/font_family.dart';
import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';


class TextFildWidget extends StatefulWidget {
  TextFildWidget(
      {
        Key? key,
      required this.hintText,
      this.controller,
      this.isPassword,
      this.onChanged,
      this.onTap,
      this.enabled,
      this.maxLines,
      this.prefixIcon,
      this.suffixIcon,
      this.textInputType,
      required this.messageErro})
      : super(key: key);
  String? hintText;
  bool? isPassword = false;
  String? messageErro;
  Function()?onTap;
  bool? enabled;
  int? maxLines;
  final IconData? prefixIcon;
  Widget? suffixIcon;

  TextEditingController? controller;
  void Function(String)? onChanged;
  TextInputType? textInputType = TextInputType.text;

  @override
  State<TextFildWidget> createState() => _TextFildWidgetState();
}

class _TextFildWidgetState extends State<TextFildWidget> {
  bool? isString = true;
bool isFocused = false;
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return (widget.isPassword == false)
        ?TextFormField(
      keyboardType: widget.textInputType,
      onChanged: widget.onChanged,
      controller: widget.controller,
      onTap: () {
        setState(() {
          isFocused = true;
        });
        widget.onTap?.call();
      },
      enabled:widget.enabled,
      maxLines:widget.maxLines??1,
      decoration: InputDecoration(
    
        errorText: widget.messageErro,
        helperText: ' ',
        suffixIcon:widget.suffixIcon,
            prefixIcon: Icon(
          widget.prefixIcon,
          color: isFocused ? AppColors.primaryColor : AppColors.lightGrayColor,
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontFamily: AppFonts.clashDisplayRegular,
            color: AppColors.lightGrayColor,
            fontSize: 14),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.borderColor),
            gapPadding: 10),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.primaryColor),
            gapPadding: 10),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.borderColor),
            gapPadding: 10),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        filled: true,
        contentPadding:
        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      fillColor: isFocused ? Color(0xffFDE7C7) : AppColors.bggrayColor,

      ),
        )
        :TextFormField(
      onTap: widget.onTap,
      enabled:widget.enabled,
      maxLines:widget.maxLines??1,
      keyboardType: widget.textInputType,
      onChanged: widget.onChanged,
      controller: widget.controller,
      obscureText: _isHidden,
      decoration: InputDecoration(
        suffixIcon:widget.suffixIcon,
        prefixIcon: Icon(
          widget.prefixIcon,
          color: isFocused ? AppColors.borderColor : AppColors.primaryColor,
        ),
        suffix: InkWell(
          onTap: _togglePasswordView,
          child: Icon(
            _isHidden
                ? Icons.visibility
                : Icons.visibility_off,
          ),
        ),
        errorText: widget.messageErro,
        helperText: ' ',
         hintText: widget.hintText,
        hintStyle: TextStyle(
            color: Color(0xff8D9091), fontSize:14),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: Color(0xffEFEFEF)),
            gapPadding: 10),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: Color(0xff175CFF)),
            gapPadding: 10),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: Color(0xffEFEFEF)),
            gapPadding: 10),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        filled: true,
        contentPadding:
        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        fillColor: Color(0xffFBFBFB),

      ),
        );
  }

  void _togglePasswordView() {
  
     
      setState(() {
      _isHidden = !_isHidden;
    });
   
  }
}
