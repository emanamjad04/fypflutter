import 'package:flutter/material.dart';

import '../../common/app_colors.dart';
import 'apptext.dart';

class Cards extends StatelessWidget {

  final String text;
  final String image;
  const Cards({required this.text,required this.image,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Secondary
      ),
      height: 276,
      width: 248,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(10),
            width: 220,
            height: 138,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white
            ),
            child: Image.asset(image,height: 6,),
          ),
          SizedBox(height: 30,),
          Apptext(text: text,color: Colors.white,size: 17,)
        ],
      ),
    );
  }
}
