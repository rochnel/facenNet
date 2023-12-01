import 'package:flutter/material.dart';

class MultiLineTextField extends StatefulWidget {
  final double height;
  final double width;
  final int minLength;
  final int maxLength;
  final String labelText;
  final String hintText;
  final bool? count;
  final TextEditingController controller;

  const MultiLineTextField(
      {Key? key,
      required this.height,
      required this.width,
      required this.minLength,
      required this.maxLength,
      required this.labelText,
      required this.hintText,
      required this.controller,
      this.count})
      : super(key: key);

  @override
  _MultiLineTextFieldState createState() => _MultiLineTextFieldState();
}

class _MultiLineTextFieldState extends State<MultiLineTextField> {
  int _characterCount = 0;

  get height => height;
  get width => width;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updateCharacterCount);
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  void _updateCharacterCount() {
    setState(() {
      _characterCount = widget.controller.text.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widget.count == true
            ? Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Text(
                    '$_characterCount / ${widget.maxLength}',
                    style: TextStyle(
                      color: _characterCount <= widget.maxLength
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                ),
              )
            : SizedBox(),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            minLines: 5,
            controller: widget.controller,
            onChanged: (_) => _updateCharacterCount(),
            keyboardType: TextInputType.multiline,
            maxLines: null,
            maxLength: widget.maxLength,
            decoration: InputDecoration(
              helperText: ' ',
              labelText: widget.labelText,
              labelStyle:
                  TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
              hintText: widget.labelText,
              hintStyle: const TextStyle(
                color: const Color(0xff8D9091),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 179, 177, 177)),
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
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              fillColor: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}
