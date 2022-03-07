import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy/src/app_theme/app_theme.dart';
import 'package:pharmacy/src/model/menu_model.dart';
import 'package:pharmacy/src/ui/main/menu_screen/region_screen.dart';
import 'package:pharmacy/src/utils/utils.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<MenuModel> items = [
    MenuModel(
      icon: "assets/icons/menu/icon1.svg",
      title: "О программе лояльности",
      minititle: "",
      icon2: "assets/icons/menu/iconless.svg",
    ),
    MenuModel(
      icon: "assets/icons/menu/icon2.svg",
      title: "Город",
      minititle: "Ташкент",
      icon2: "assets/icons/menu/iconless.svg",
    ),
    MenuModel(
      icon: "assets/icons/menu/icon3.svg",
      title: "Любимые аптеки",
      minititle: "",
      icon2: "assets/icons/menu/iconless.svg",
    ),
    MenuModel(
      icon: "assets/icons/menu/icon4.svg",
      title: "Язык",
      minititle: "Русский",
      icon2: "assets/icons/menu/iconless.svg",
    ),
    MenuModel(
      icon: "assets/icons/menu/icon5.svg",
      title: "О приложении",
      minititle: "",
      icon2: "assets/icons/menu/iconless.svg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    double o = (h + w) / 2;
    return Scaffold(
      backgroundColor: AppTheme.maincolor,
      body: ListView(
        children: [
          SizedBox(height: 32 * h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16 * w),
            height: 160 * h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF70B2FF),
              borderRadius: BorderRadius.circular(10 * o),
            ),
            child: Column(
              children: [
                Container(
                  child: Text(
                    "Чтобы совершать покупки, копить бонусы и иметь быстрый доступ к карте лояльности"
                    " войдите или зарегистрируйтесь",
                    style: TextStyle(
                      color: AppTheme.maincolor,
                      fontSize: 13 * o,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppTheme.fontFamily,
                    ),
                  ),
                  margin: EdgeInsets.all(16 * o),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 128 * w,
                        height: 44 * h,
                        decoration: BoxDecoration(
                          color: AppTheme.maincolor,
                          borderRadius: BorderRadius.circular(10 * o),
                        ),
                        child: Center(
                          child: Text(
                            "Вход",
                            style: TextStyle(
                              color: AppTheme.bluecolor,
                              fontSize: 16 * o,
                              fontWeight: FontWeight.w500,
                              fontFamily: AppTheme.fontFamily,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 44 * h,
                        width: 132 * w,
                        decoration: BoxDecoration(
                          color: const Color(0xFF70B2FF),
                          borderRadius: BorderRadius.circular(10 * o),
                          border:
                              Border.all(color: AppTheme.maincolor, width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.maincolor,
                              blurRadius: 4,
                              offset: Offset.zero,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "Регистрация",
                            style: TextStyle(
                              color: AppTheme.maincolor,
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
                SizedBox(height: 16 * h),
              ],
            ),
          ),
          SizedBox(height: 32 * h),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16 * w),
              child: Row(
                children: [
                  SvgPicture.asset(
                    items[0].icon,
                    color: AppTheme.bluecolor,
                    height: 20 * h,
                    width: 20 * w,
                  ),
                  SizedBox(width: 18 * w),
                  Text(
                    items[0].title,
                    style: TextStyle(
                      color: AppTheme.blackcolor,
                      fontSize: 16 * o,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppTheme.fontFamily,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    items[0].minititle,
                    style: TextStyle(
                      color: const Color(0xFFB8C1CC),
                      fontSize: 16 * o,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppTheme.fontFamily,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16 * w),
                    child: SvgPicture.asset(items[0].icon2),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 32 * h),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const RegionPage();
                  },
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16 * w),
              child: Row(
                children: [
                  SvgPicture.asset(
                    items[1].icon,
                    color: AppTheme.bluecolor,
                    height: 20 * h,
                    width: 20 * w,
                  ),
                  SizedBox(width: 18 * w),
                  Text(
                    items[1].title,
                    style: TextStyle(
                      color: AppTheme.blackcolor,
                      fontSize: 16 * o,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppTheme.fontFamily,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    items[1].minititle,
                    style: TextStyle(
                      color: const Color(0xFFB8C1CC),
                      fontSize: 16 * o,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppTheme.fontFamily,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16 * w),
                    child: SvgPicture.asset(items[1].icon2),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 32 * h),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16 * w),
              child: Row(
                children: [
                  SvgPicture.asset(
                    items[2].icon,
                    color: AppTheme.bluecolor,
                    height: 20 * h,
                    width: 20 * w,
                  ),
                  SizedBox(width: 18 * w),
                  Text(
                    items[0].title,
                    style: TextStyle(
                      color: AppTheme.blackcolor,
                      fontSize: 16 * o,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppTheme.fontFamily,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    items[2].minititle,
                    style: TextStyle(
                      color: const Color(0xFFB8C1CC),
                      fontSize: 16 * o,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppTheme.fontFamily,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16 * w),
                    child: SvgPicture.asset(items[2].icon2),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 32 * h),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16 * w),
              child: Row(
                children: [
                  SvgPicture.asset(
                    items[3].icon,
                    color: AppTheme.bluecolor,
                    height: 20 * h,
                    width: 20 * w,
                  ),
                  SizedBox(width: 18 * w),
                  Text(
                    items[3].title,
                    style: TextStyle(
                      color: AppTheme.blackcolor,
                      fontSize: 16 * o,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppTheme.fontFamily,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    items[3].minititle,
                    style: TextStyle(
                      color: const Color(0xFFB8C1CC),
                      fontSize: 16 * o,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppTheme.fontFamily,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16 * w),
                    child: SvgPicture.asset(items[3].icon2),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 32 * h),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16 * w),
              child: Row(
                children: [
                  SvgPicture.asset(
                    items[4].icon,
                    color: AppTheme.bluecolor,
                    height: 20 * h,
                    width: 20 * w,
                  ),
                  SizedBox(width: 18 * w),
                  Text(
                    items[4].title,
                    style: TextStyle(
                      color: AppTheme.blackcolor,
                      fontSize: 16 * o,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppTheme.fontFamily,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    items[4].minititle,
                    style: TextStyle(
                      color: const Color(0xFFB8C1CC),
                      fontSize: 16 * o,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppTheme.fontFamily,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16 * w),
                    child: SvgPicture.asset(items[4].icon2),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
