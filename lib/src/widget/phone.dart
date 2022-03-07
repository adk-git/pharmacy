import 'package:flutter/material.dart';

import '../app_theme/app_theme.dart';
import '../utils/utils.dart';

class PhoneWidget extends StatefulWidget {
  final TextEditingController controller;

  const PhoneWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _PhoneState createState() => _PhoneState();
}

class _PhoneState extends State<PhoneWidget> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    double o = (h + w) / 2;
    return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 16 * w,
        ),
        padding: EdgeInsets.symmetric(horizontal: 12 * w),
        decoration: BoxDecoration(
          color: const Color(0xFFF2F3F5),
          borderRadius: BorderRadius.circular(10 * o),
        ),
        height: 64 * h,
        width: 343 * w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8 * h),
            Expanded(
              child: Text(
                "Номер телефона",
                style: TextStyle(
                  color: const Color(0xFF6D7885),
                  fontSize: 11 * o,
                  fontFamily: AppTheme.fontFamily,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: widget.controller,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 16 * o,
                  fontFamily: AppTheme.fontFamily,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.25 * o,
                  color: AppTheme.blackcolor,
                ),
                decoration: InputDecoration(
                  prefix: Text(
                    "+998",
                    style: TextStyle(
                      fontSize: 16 * o,
                      fontFamily: AppTheme.fontFamily,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.blackcolor,
                      letterSpacing: 0.25 * o,
                    ),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ));
  }
}
