import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy/src/app_theme/app_theme.dart';
import 'package:pharmacy/src/bloc/home_bloc.dart';
import 'package:pharmacy/src/model/drug_model.dart';
import 'package:pharmacy/src/model/pages_model.dart';
import 'package:pharmacy/src/model/sale_model.dart';
import 'package:pharmacy/src/ui/main/home/news/news_list_screen.dart';
import 'package:pharmacy/src/utils/utils.dart';
import 'package:pharmacy/src/widget/search_bar.dart';
import '../../../widget/app/title_widget.dart';
import '../../../widget/home/home_banner_widget.dart';
import '../../../widget/home/home_header_widget.dart';
import '../../../widget/shimmer/banner_shimmer.dart';
import 'best/best_drug_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PagesModel? pagesData;

  @override
  void initState() {
    homeBloc.getSale();
    homeBloc.getDrugs();
    homeBloc.getPages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    double o = (h + w) / 2;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.maincolor,
        elevation: 0.0,
        title: const SearchWidget(),
      ),
      body: Container(
        color: AppTheme.maincolor,
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            const HomeHeaderWidget(),
            SizedBox(height: 32 * h),
            SizedBox(
              height: 155 * h,
              child: StreamBuilder<SaleModel>(
                stream: homeBloc.allSale,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return HomeBannerWidget(
                      saleData: snapshot.data!,
                    );
                  }
                  return const BannerShimmer();
                },
              ),
            ),
            SizedBox(height: 32 * h),
            TitleWidget(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const BestDrugScreen();
                    },
                  ),
                );
              },
              right: 'dscsvfs',
              left: 'dscsdc',
            ),
            SizedBox(height: 16 * h),
            SizedBox(
              height: 270 * h,
              width: 140 * w,
              child: StreamBuilder<DrugModel>(
                stream: homeBloc.allDrugs,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    DrugModel drugData = snapshot.data!;
                    return ListView.builder(
                      itemCount: drugData.results.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 12 * w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CachedNetworkImage(
                                imageUrl: drugData.results[index].image,
                                height: 140 * h,
                                width: 140 * w,
                              ),
                              SizedBox(height: 8 * h),
                              SizedBox(
                                width: 140 * w,
                                child: Text(
                                  drugData.results[index].name,
                                  style: TextStyle(
                                    color: AppTheme.blackcolor,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: AppTheme.fontFamily,
                                    fontSize: 13 * o,
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                              SizedBox(height: 4 * h),
                              SizedBox(
                                width: 140 * w,
                                child: Text(
                                  drugData.results[index].manufacturer.name,
                                  style: TextStyle(
                                    color: AppTheme.greycolor,
                                    fontSize: 12 * o,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: AppTheme.fontFamily,
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                              SizedBox(height: 8 * h),
                              const Spacer(),
                              Container(
                                  decoration: BoxDecoration(
                                    color: AppTheme.bluecolor,
                                    borderRadius: BorderRadius.circular(10 * o),
                                  ),
                                  height: 30 * h,
                                  width: 128 * w,
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Text(
                                          drugData.results[index].price
                                                  .toInt()
                                                  .toString() +
                                              " сум",
                                          style: TextStyle(
                                            color: AppTheme.maincolor,
                                            fontSize: 12 * o,
                                            fontFamily: AppTheme.fontFamily,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        padding: EdgeInsets.only(left: 8 * w),
                                      ),
                                      const Spacer(),
                                      Container(
                                        child: SvgPicture.asset(
                                          "assets/icons/bin.svg",
                                          color: AppTheme.maincolor,
                                        ),
                                        padding: EdgeInsets.only(right: 8 * w),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        );
                      },
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
            SizedBox(height: 16 * h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12 * w),
              child: Row(
                children: [
                  Text(
                    "Полезные статьи",
                    style: TextStyle(
                      color: AppTheme.blackcolor,
                      fontSize: 20 * o,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5 * o,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const NewsListScreen();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Все",
                      style: TextStyle(
                        color: AppTheme.bluecolor,
                        fontSize: 15 * o,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 16 * h),
            SizedBox(
                height: 160 * h,
                child: StreamBuilder<PagesModel>(
                    stream: homeBloc.allPages,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        PagesModel pagesData = snapshot.data!;
                        return ListView.builder(
                          itemCount: pagesData.results.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 128 * h,
                              width: 288 * w,
                              margin: EdgeInsets.all(12 * o),
                              decoration: BoxDecoration(
                                color: AppTheme.maincolor,
                                borderRadius: BorderRadius.circular(10 * o),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF000000),
                                    blurRadius: 4 * o,
                                    offset: Offset.zero,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            pagesData.results[index].image,
                                        height: 140 * h,
                                        width: 140 * w,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8 * w),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        SizedBox(height: 16 * h),
                                        Text(
                                          pagesData.results[index].createdAt
                                              .toString(),
                                          style: TextStyle(
                                            color: const Color(0xFF818C99),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11 * o,
                                            fontFamily: AppTheme.fontFamily,
                                          ),
                                        ),
                                        SizedBox(height: 4 * h),
                                        Text(
                                          pagesData.results[index].title,
                                          style: TextStyle(
                                            color: AppTheme.blackcolor,
                                            fontSize: 13 * o,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: AppTheme.fontFamily,
                                          ),
                                          maxLines: 2,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                      return const CircularProgressIndicator();
                    })),
            SizedBox(height: 24 * h),
          ],
        ),
      ),
    );
  }
}
