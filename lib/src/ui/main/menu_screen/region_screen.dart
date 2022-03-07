import 'package:flutter/material.dart';
import 'package:pharmacy/src/bloc/region_bloc.dart';
import 'package:pharmacy/src/model/region_model.dart';
import 'package:pharmacy/src/utils/utils.dart';
import 'package:pharmacy/src/widget/search_bar.dart';

import '../../../app_theme/app_theme.dart';

class RegionPage extends StatefulWidget {
  const RegionPage({
    Key? key,
  }) : super(key: key);

  @override
  _RegionPageState createState() => _RegionPageState();
}

class _RegionPageState extends State<RegionPage> {
  @override
  void initState() {
    regionBloc.getRegion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    double o = (h + w) / 2;
    return Scaffold(
      backgroundColor: AppTheme.maincolor,
      appBar: AppBar(
        backgroundColor: AppTheme.maincolor,
        elevation: 0,
        iconTheme: IconThemeData(color: AppTheme.bluecolor),
        title: Text(
          "Город",
          style: TextStyle(
            color: AppTheme.blackcolor,
            fontSize: 17 * o,
            fontFamily: AppTheme.fontFamily,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12 * w),
            child: const SearchWidget(),
          ),
          SizedBox(height: 16 * h),
          Expanded(
            child: StreamBuilder<List<RegionModel>>(
                stream: regionBloc.allRegion,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<RegionModel> regionData = snapshot.data!;
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: regionData.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                height: 32,
                                width: double.infinity,
                                margin:
                                    EdgeInsets.symmetric(horizontal: 16 * w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Spacer(),
                                    Text(
                                      regionData[index].name,
                                      style: TextStyle(
                                        fontSize: 16 * o,
                                        fontWeight: FontWeight.w400,
                                        color: AppTheme.blackcolor,
                                        fontFamily: AppTheme.fontFamily,
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      width: 375 * w,
                                      height: 1 * h,
                                      color: const Color(0xFFF2F3F5),
                                    ),

                                    // Text(regionData.childs.)
                                  ],
                                ),
                              ),
                            ],
                          );
                        });
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
          )
        ],
      ),
    );
  }
}
