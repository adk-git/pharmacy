import 'package:flutter/material.dart';

import '../../model/event/EventModel.dart';
import '../../utils/rx_bus.dart';
import '../../utils/utils.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return SizedBox(
      height: 113 * h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          GestureDetector(
            onTap: () {
              RxBus.post(EventModel(1), tag: "BOTTOM_VIEW");
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12 * w),
              height: 113 * h,
              width: 113 * w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10 * h),
              ),
              child: ClipRRect(
                child: Image.asset(
                  "assets/images/card1.png",
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10 * h),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(right: 12 * w),
              height: 113 * h,
              width: 113 * w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10 * h),
                child: Image.asset(
                  "assets/images/card2.png",
                  fit: BoxFit.cover,
                ),
              )),
          Container(
            margin: EdgeInsets.only(right: 12 * w),
            height: 113 * h,
            width: 113 * w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10 * h),
              child: Image.asset(
                "assets/images/card3.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 12 * w),
            height: 113 * h,
            width: 113 * w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10 * h),
              child: Image.asset(
                "assets/images/card1.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 12 * w),
            height: 113 * h,
            width: 113 * w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10 * h),
              child: Image.asset(
                "assets/images/card2.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 12 * w),
            height: 113 * h,
            width: 113 * w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10 * h),
              child: Image.asset(
                "assets/images/card3.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
