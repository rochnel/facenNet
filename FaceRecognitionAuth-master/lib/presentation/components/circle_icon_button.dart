
import 'package:face_net_authentication/presentation/components/buttons/BorderIcon.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';

class CircleIconButton extends StatelessWidget {
  final Color color;
  const CircleIconButton({Key? key, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
     child:    Positioned(
                    top: 15,
                    right: 15,
                    child: BorderIcon(
                        child: const Icon(
                      Icons.favorite_border,
                      color: Colors.black,
                    ))),
    );
  }
}
