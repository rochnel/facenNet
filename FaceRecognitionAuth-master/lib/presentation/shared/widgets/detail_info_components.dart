
import 'package:flutter/material.dart';

class DetailsInfos extends StatelessWidget {
  DetailsInfos(
      {Key? key,
      this.text1,
      this.text2})
      : super(key: key);
  String? text1;
  String? text2;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top:4),
                child: Text(text1!,
                    style: TextStyle(
                        color: Color(0xffCCCCCC),
                        decoration: TextDecoration.none,
                        fontSize: 14)),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top:4),
                child: Text(text2!,
                    style: TextStyle(
                        color: Colors.black87,
                        decoration: TextDecoration.none,
                        fontSize: 14)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
