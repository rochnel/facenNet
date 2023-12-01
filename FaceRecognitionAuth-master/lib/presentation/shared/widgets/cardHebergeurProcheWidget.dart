
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/config/font_family.dart';

class CardHebergementProch extends StatelessWidget {
  const CardHebergementProch({
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                  width: width * 250,
                  height: height * 242.55,
                  child: Image.asset(
                    "assets/images/icons/home_img.png",
                    fit: BoxFit.fill,
                  )),

              Positioned(
                top: 6,
                left: 6,
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.primaryColor,
                  ),
                  child: Row(
                    children: [
                      Text(
                        '70.000 Fcfa',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 8.6,
                            fontFamily: AppFonts.clashDisplaySemibold),
                      ),
                      Text(
                        ' /Nuit',
                        style: TextStyle(
                            color: Colors.white, fontSize: 8.6),
                      ),
                    ],
                  ),
                ),
              ),
              // Icône en haut à droite
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                           
                              color: Colors.black12),
                        ],
                      ),
                      width: width * 205,
                      margin: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "Suite prestige",
                                  style: TextStyle(
                                    fontSize: 10.6,
                                    fontFamily:
                                        AppFonts.clashDisplayRegular,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                      "assets/images/icons/star.svg"),
                                  SvgPicture.asset(
                                      "assets/images/icons/star.svg"),
                                  SvgPicture.asset(
                                      "assets/images/icons/star.svg"),
                                  SvgPicture.asset(
                                      "assets/images/icons/demistar.svg"),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Hilton hotel",
                            style: TextStyle(
                              fontSize: 12.6,
                              fontFamily: AppFonts.clashDisplayBold,
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              
                              Flexible(
                                child: Text(
                                  "Un parfait mélange entre le classir et le comptemporain dans la ville de yaoundé.",
                                  style: TextStyle(
                                    fontSize: 10.6,
                                    fontFamily:
                                        AppFonts.clashDisplayRegular,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
