import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatelessWidget {
  TextFieldWidget(
      {Key? key,
      required this.height,
      required this.width,
      required this.labelText,
      required this.hintText,
      this.controller,
      this.onChanged,
      this.isDate = false,
      this.color,
      this.textInputType,
      this.messageErro})
      : super(key: key);
  String? labelText;
  String? hintText;
  bool? isDate = false;
  final double height;
  final double width;
  Color? color;
  bool? isString = true;
  String? messageErro;
  TextEditingController? controller;
  void Function(String)? onChanged;
  TextInputType? textInputType = TextInputType.text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: height * 48,
      width: width * 330,
      child: (isDate == true)
          ? TextFormField(
              readOnly: true,
              // keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.calendar_today_outlined,
                    ),
                  ),
                  labelText: labelText,
                  labelStyle: TextStyle(
                      color: Colors.orange,
                      fontSize: width * 11,
                      fontWeight: FontWeight.bold),
                  hintText: hintText,
                  hintStyle: TextStyle(
                      color: const Color(0xff8D9091), fontSize: width * 13),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(color: Color(0xffEFEFEF)),
                      gapPadding: 10),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(color: Color(0xff175CFF)),
                      gapPadding: 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(color: Color(0xffEFEFEF)),
                      gapPadding: 10),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  filled: true,
                  fillColor: color != null ? color : const Color(0xffFBFBFB),
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: width * (20), vertical: width * (9))),
            )
          : TextFormField(
              keyboardType: textInputType,
              onChanged: onChanged,
              controller: controller,
              // expands: true,
              decoration: InputDecoration(
                errorText: messageErro,
                helperText: ' ',
                labelText: labelText,
                labelStyle: TextStyle(
                    color: Colors.orange,
                    fontSize: width * 11,
                    fontWeight: FontWeight.bold),
                hintText: hintText,
                hintStyle: TextStyle(
                    color: const Color(0xff8D9091), fontSize: width * 13),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 134, 131, 131)),
                    gapPadding: 10),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: Colors.green),
                    gapPadding: 10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 163, 159, 159)),
                    gapPadding: 10),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                filled: true,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                fillColor: color != null ? color : const Color(0xffFBFBFB),
              ),
            ),
    );
  }
}
