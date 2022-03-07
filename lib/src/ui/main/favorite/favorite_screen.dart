import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy/src/app_theme/app_theme.dart';
import 'package:pharmacy/src/bloc/fav_bloc.dart';
import 'package:pharmacy/src/utils/rx_bus.dart';
import 'package:pharmacy/src/utils/utils.dart';
import '../../../model/event/EventModel.dart';
import '../../../model/fav_model.dart';
import '../home/best/best_drug_screen.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    favBloc.getFav();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    double o = (h + w) / 2;
    return Scaffold(
      backgroundColor: AppTheme.maincolor,
      body: StreamBuilder<List<FavModel>>(
          stream: favBloc.allFave,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              List<FavModel> data = snapshot.data!;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Text(data[index].name);
                },
                itemCount: data.length,
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 260 * h),
                Center(
                    child: SvgPicture.asset(
                  "assets/icons/favorite/favorite.svg",
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
            );
          }),
    );
  }
}
