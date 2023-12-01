import 'package:flutter/material.dart';

class TabButton extends StatefulWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const TabButton({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  _TabButtonState createState() => _TabButtonState();
}

class _TabButtonState extends State<TabButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Card(
        color: widget.isSelected ? Colors.green : Colors.white,
        elevation: widget.isSelected ? 5 : 2,
        shape: ShapeBorder.lerp(StadiumBorder(), StadiumBorder(), 10),
        child: Container(
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Text(
            widget.text,
            style: TextStyle(
              color: widget.isSelected ? Colors.white : Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

class TabButton2 extends StatefulWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const TabButton2({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  _TabButton2State createState() => _TabButton2State();
}

class _TabButton2State extends State<TabButton2> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Card(
        color: widget.isSelected ? Colors.green : Colors.white,
        elevation: widget.isSelected ? 5 : 2,
        shape: RoundedRectangleBorder(),
        child: Container(
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Text(
            widget.text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: widget.isSelected ? Colors.white : Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
