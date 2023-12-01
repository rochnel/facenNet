
import 'package:flutter/material.dart';

import '../../../core/config/app_assets.dart';

class MoreIconeWidget extends StatelessWidget {
  const MoreIconeWidget({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
    color: Color(0xfff7F7FC),
    child: Image.asset(AppImages.vector7),
    );
  }
}




