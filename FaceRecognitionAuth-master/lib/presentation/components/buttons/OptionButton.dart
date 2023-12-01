import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final double? width;

  const OptionButton({required this.text, this.icon, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(20, 25, 45, 1.0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          ),
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              addHorizontalSpace(10),
              Flexible(
                child: Text(
                  text,
                  style: TextStyle(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          )),
    );
  }

  addHorizontalSpace(double i) {
    return SizedBox(width: i);
  }
}
