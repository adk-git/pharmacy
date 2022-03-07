import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacy/src/utils/utils.dart';

import '../../../app_theme/app_theme.dart';
import '../../../model/event/EventModel.dart';
import '../../../utils/rx_bus.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    double o = (h + w) / 2;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 260 * h),
          Center(
              child: SvgPicture.asset(
            "assets/icons/bin/bin.svg",
            height: 153 * h,
            width: 153 * w,
          )),
          SizedBox(height: 16 * h),
          Text(
            "В избранном пока пусто",
            style: TextStyle(
              fontSize: 20 * o,
              fontFamily: AppTheme.fontFamily,
              color: AppTheme.blackcolor,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 4 * h),
          Text(
            "Здесь будут ваши любимые товары",
            style: TextStyle(
              color: AppTheme.greycolor,
              fontSize: 16 * o,
              fontFamily: AppTheme.fontFamily,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 24 * h),
          GestureDetector(
            onTap: () {
              RxBus.post(EventModel(1), tag: "BOTTOM_VIEW");
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return const BestDeals();
              // }));
            },
            child: Container(
              height: 36 * h,
              width: 170 * w,
              decoration: BoxDecoration(
                color: AppTheme.maincolor,
                borderRadius: BorderRadius.circular(16 * o),
                border: Border.all(
                  color: AppTheme.bluecolor,
                  width: 1 * o,
                ),
              ),
              child: Center(
                child: Text(
                  "Перейти в каталог",
                  style: TextStyle(
                    color: AppTheme.bluecolor,
                    fontSize: 16 * o,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppTheme.fontFamily,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
