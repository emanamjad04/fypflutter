import 'package:flutter/material.dart';
import 'package:sosansheaven/ui/common/app_colors.dart';

class Apptext extends StatelessWidget {

  final String text;
  final double size;
  final bool isbold;
  final bool textaligncenter;
  final Color color;
  const Apptext({
    this.color=Colors.black,
    this.textaligncenter=false,
    required this.text,
    this.size=25,
     this.isbold=false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textaligncenter?TextAlign.center:TextAlign.start,
      style: TextStyle(
        fontSize: size,
        fontFamily: 'appfont',
        fontWeight: isbold? FontWeight.bold : null,
        color: color,

      ),
    );
  }
}
