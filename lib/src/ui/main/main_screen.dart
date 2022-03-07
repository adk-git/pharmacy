import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy/src/model/event/EventModel.dart';
import 'package:pharmacy/src/utils/rx_bus.dart';

import 'card/card_screen.dart';
import 'category/category_screen.dart';
import 'favorite/favorite_screen.dart';
import 'home/home_screen.dart';
import 'menu_screen/menu_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selected = 0;
  List<Widget> pages = [
    const HomeScreen(),
    const CategoryScreen(),
    const CardScreen(),
    const FavoritePage(),
    const MenuPage(),
  ];

  @override
  void initState() {
    _registerBus();
    super.initState();
  }

  @override
  void dispose() {
    RxBus.destroy(tag: "BOTTOM_VIEW");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selected],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selected,
        onTap: (_index) {
          setState(() {
            _selected = _index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/home.svg"),
            activeIcon: SvgPicture.asset("assets/icons/home_color.svg"),
            label: "Главная",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/catalog.svg",
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/catalog_color.svg",
            ),
            label: "Каталог",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/bin.svg",
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/bin_color.svg",
            ),
            label: "Корзина",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/favorite.svg",
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/favorite_color.svg",
            ),
            label: "Избранное",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/menu.svg",
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/menu_color.svg",
            ),
            label: "Меню",
          ),
        ],
      ),
    );
  }

  void _registerBus() {
    RxBus.register<EventModel>(tag: "BOTTOM_VIEW").listen((event) {
      setState(() {
        _selected = event.position;
      });
    });
  }
}
