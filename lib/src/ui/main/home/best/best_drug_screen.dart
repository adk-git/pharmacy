import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy/src/bloc/home_bloc.dart';
import 'package:pharmacy/src/model/drug_model.dart';
import 'package:pharmacy/src/widget/search_bar.dart';
import '../../../../app_theme/app_theme.dart';
import '../../../../utils/utils.dart';

class BestDrugScreen extends StatefulWidget {
  const BestDrugScreen({Key? key}) : super(key: key);

  @override
  _BestDrugScreenState createState() => _BestDrugScreenState();
}

class _BestDrugScreenState extends State<BestDrugScreen> {
  DrugModel? drugData;
  bool select = true;

  @override
  void initState() {
    super.initState();
    homeBloc.getDrugs();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    double o = (h + w) / 2;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppTheme.bluecolor),
        backgroundColor: AppTheme.maincolor,
        elevation: 0,
        title: Column(
          children: [
            Text(
              "Лучшие предложения",
              style: TextStyle(
                color: AppTheme.blackcolor,
                fontSize: 17 * o,
                fontWeight: FontWeight.w500,
                fontFamily: AppTheme.fontFamily,
              ),
            ),
            SizedBox(height: 4 * h),
          ],
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        // shrinkWrap: true,
        children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 12 * w),
              child: const SearchWidget()),
          SizedBox(height: 16 * h),
          Row(
            children: [
              SizedBox(
                height: 40 * h,
                width: 187 * w,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16 * w),
                      height: 32 * h,
                      width: 32 * w,
                      child: ClipRRect(
                        child: SvgPicture.asset(
                          "assets/icons/playlist1.svg",
                          fit: BoxFit.cover,
                          color: AppTheme.bluecolor,
                        ),
                      ),
                    ),
                    Text(
                      "По названию",
                      style: TextStyle(
                        color: AppTheme.blackcolor,
                        fontSize: 16 * o,
                        fontWeight: FontWeight.w500,
                        fontFamily: AppTheme.fontFamily,
                      ),
                    ),
                  ],
                ),
              ),

              // const Spacer(),
              Container(
                height: 32 * h,
                width: 1 * w,
                color: AppTheme.blackcolor,
              ),

              SizedBox(
                height: 40 * h,
                width: 187 * w,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16 * w),
                      height: 32 * h,
                      width: 32 * w,
                      child: ClipRRect(
                        child: SvgPicture.asset(
                          "assets/icons/playlist2.svg",
                          fit: BoxFit.cover,
                          color: AppTheme.bluecolor,
                        ),
                      ),
                    ),
                    Text(
                      "Фильтр",
                      style: TextStyle(
                        color: AppTheme.blackcolor,
                        fontSize: 16 * o,
                        fontWeight: FontWeight.w500,
                        fontFamily: AppTheme.fontFamily,
                      ),
                    ),
                  ],
                ),
              ),

              // const Spacer(),
            ],
          ),
          SizedBox(height: 4 * h),
          Container(
            width: 375 * w,
            height: 1 * h,
            color: AppTheme.blackcolor,
          ),
          StreamBuilder<DrugModel>(
              stream: homeBloc.allDrugs,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  DrugModel drugData = snapshot.data!;
                  return ListView.builder(
                      itemCount: drugData.results.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 12 * w),
                          child: Column(
                            children: [
                              SizedBox(height: 16 * h),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 128 * h,
                                    width: 128 * w,
                                    child: ClipRRect(
                                      child: CachedNetworkImage(
                                        imageUrl: drugData.results[index].image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8 * w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          child: Text(
                                            drugData.results[index].name,
                                            style: TextStyle(
                                              color: AppTheme.blackcolor,
                                              fontSize: 16 * o,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: AppTheme.fontFamily,
                                            ),
                                            maxLines: 2,
                                          ),
                                        ),
                                        SizedBox(height: 4 * h),
                                        Text(
                                          drugData
                                              .results[index].manufacturer.name,
                                          style: TextStyle(
                                            color: AppTheme.greycolor,
                                            fontSize: 13 * o,
                                            fontFamily: AppTheme.fontFamily,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(height: 8 * h),
                                        Text(
                                          drugData.results[index].price
                                                  .toInt()
                                                  .toString() +
                                              " сум",
                                          style: TextStyle(
                                            color: AppTheme.blackcolor,
                                            fontSize: 15 * o,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: AppTheme.fontFamily,
                                          ),
                                        ),
                                        SizedBox(height: 8 * h),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: AppTheme.bluecolor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10 * o),
                                                ),
                                                height: 30 * h,
                                                width: 120 * w,
                                                child: Center(
                                                  child: Text(
                                                    "В корзину",
                                                    style: TextStyle(
                                                      color: AppTheme.maincolor,
                                                      fontSize: 13 * o,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          AppTheme.fontFamily,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const Spacer(),
                                            GestureDetector(
                                              onTap: () {
                                                homeBloc.saveFav(
                                                    drugData, index);
                                              },
                                              child: drugData
                                                      .results[index].favourite
                                                  ? SvgPicture.asset(
                                                      "assets/icons/like_colored.svg")
                                                  : SvgPicture.asset(
                                                      "assets/icons/like.svg"),
                                            ),
                                            const Spacer(),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 8 * h),
                                ],
                              ),
                              SizedBox(height: 16 * h),
                              Container(
                                width: 375 * w,
                                height: 1 * h,
                                color: AppTheme.blackcolor,
                              ),
                            ],
                          ),
                        );
                      });
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ],
      ),
    );
  }
}
