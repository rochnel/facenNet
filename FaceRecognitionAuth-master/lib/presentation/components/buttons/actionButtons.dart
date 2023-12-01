import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      width: 60.0,
      height: 60.0,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
      ),
      child: IconButton(
        icon: const Icon(Icons.info),
        color: Colors.white,
        onPressed: () {},
      ),
    );
  }
}

class RoundedFullButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0), // Adjust the border radius
        ),
      ),
      child: const Text(
        'Reserver',
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
    );
  }
}
