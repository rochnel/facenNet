import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  const DatePicker(
      {Key? key,
      required this.width,
      required this.height,
      required this.controller})
      : super(key: key);

  final double width;
  final double height;
  final TextEditingController controller;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  @override
  void initState() {
    widget.controller.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.width * 330,
        child: TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            icon: Icon(Icons.calendar_today),
            helperText: ' ',
            labelText: "Date de Naissance",
            labelStyle: TextStyle(
                color: Colors.orange,
                fontSize: widget.width * 11,
                fontWeight: FontWeight.bold),
            hintText: "Date de Naissance",
            hintStyle: TextStyle(
                color: const Color(0xff8D9091), fontSize: widget.width * 13),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 134, 131, 131)),
                gapPadding: 10),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: Colors.green),
                gapPadding: 10),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 163, 159, 159)),
                gapPadding: 10),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            fillColor: const Color(0xffFBFBFB),
          ),
          readOnly: true,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1930),
                lastDate: DateTime(2101));

            if (pickedDate != null) {
              print(
                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
              String formattedDate =
                  DateFormat('dd-MM-yyyy').format(pickedDate);
              print(
                  formattedDate); //formatted date output using intl package =>  2021-03-16
              //you can implement different kind of Date Format here according to your requirement

              setState(() {
                widget.controller.text =
                    formattedDate; //set output date to TextField value.
              });
            } else {
              print("Pas de date choisi!");
            }
          },
        ));
  }
}
