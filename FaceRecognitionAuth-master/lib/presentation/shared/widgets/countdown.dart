import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/config/font_family.dart';

class Countdown extends AnimatedWidget {

  Countdown({required this.animation}) : super(listenable: animation);
  Animation<int> animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String timerText = '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';


    return Text(
      "$timerText",
      style: TextStyle(
        fontSize: 16,
        color: AppColors.primaryColor,
        fontFamily: AppFonts.clashDisplayRegular
      ),
    );
  }
}