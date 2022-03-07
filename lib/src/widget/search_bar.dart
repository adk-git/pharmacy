import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacy/src/app_theme/app_theme.dart';
import 'package:pharmacy/src/utils/utils.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    double o = (h + w) / 2;
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 44 * h,
            padding: EdgeInsets.symmetric(horizontal: 12 * w),
            decoration: BoxDecoration(
              color: const Color(0xFFEBEDF0),
              borderRadius: BorderRadius.circular(10 * o),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.search_sharp,
                  color: AppTheme.greycolor,
                  size: 24 * o,
                ),
                SizedBox(width: 8 * w),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text(
                        "Поиск лекарств",
                        style: TextStyle(
                          color: AppTheme.greycolor,
                          fontSize: 16 * o,
                          fontWeight: FontWeight.w400,
                          fontFamily: AppTheme.fontFamily,
                        ),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Icon(
                  Icons.keyboard_voice_outlined,
                  size: 24 * o,
                  color: AppTheme.greycolor,
                )
              ],
            ),
          ),
        ),
        SizedBox(width: 16 * w),
        GestureDetector(
          onTap: () {},
          child: SvgPicture.asset(
            "assets/icons/scan.svg",
            height: 28 * h,
            width: 28 * w,
          ),
        ),
      ],
    );
  }
}
