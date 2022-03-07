import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/src/app_theme/app_theme.dart';
import 'package:pharmacy/src/utils/utils.dart';

class Entering extends StatefulWidget {
  final String name;

  const Entering({Key? key, required this.name}) : super(key: key);

  @override
  _EnteringState createState() => _EnteringState();
}

class _EnteringState extends State<Entering> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    double o = (h + w) / 2;
    return Container(
      height: 64 * h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10 * o),
        color: const Color(0xFFF2F3F5),
        border: Border.all(color: const Color(0xFF000000), width: 0.5 * o),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16 * w),
      padding: EdgeInsets.symmetric(horizontal: 12 * w),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: widget.name,
          labelStyle: TextStyle(
            color: const Color(0xFF6D7885),
            fontFamily: AppTheme.fontFamily,
            fontWeight: FontWeight.w400,
            fontSize: 15 * o,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
