import 'package:flutter/material.dart';
import 'package:pharmacy/src/utils/utils.dart';

import '../../app_theme/app_theme.dart';

class TitleWidget extends StatelessWidget {
  final String left, right;
  final Function() onTap;

  const TitleWidget({
    Key? key,
    required this.left,
    this.right = "",
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    double o = (h + w) / 2;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12 * w),
      child: Row(
        children: [
          Text(
            left,
            style: TextStyle(
              color: AppTheme.blackcolor,
              fontSize: 20 * o,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5 * o,
            ),
          ),
          const Spacer(),
          right != ""
              ? Container()
              : TextButton(
                  onPressed: () {
                    onTap();

                  },
                  child: Text(
                    right,
                    style: TextStyle(
                      color: AppTheme.bluecolor,
                      fontSize: 15 * o,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
