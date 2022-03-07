import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/src/app_theme/app_theme.dart';
import 'package:pharmacy/src/bloc/home_bloc.dart';
import 'package:pharmacy/src/model/pages_model.dart';
import 'package:pharmacy/src/ui/main/home/news/news_item_screen.dart';
import 'package:pharmacy/src/utils/utils.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({Key? key}) : super(key: key);

  @override
  _NewsListScreenState createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  PagesModel? pagesData;

  @override
  void initState() {
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
        iconTheme: IconThemeData(
          color: AppTheme.bluecolor,
        ),
        backgroundColor: AppTheme.maincolor,
        elevation: 0.25,
        title: Text(
          "Статьи",
          style: TextStyle(
            color: AppTheme.blackcolor,
            fontSize: 18 * o,
            fontWeight: FontWeight.w500,
            fontFamily: AppTheme.fontFamily,
            letterSpacing: 1 * o,
          ),
        ),
      ),
      body: StreamBuilder<PagesModel>(
          stream: homeBloc.allPages,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              PagesModel pagesData = snapshot.data!;
              return ListView.builder(
                  itemCount: pagesData.results.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return NewsItemScreen(
                                pagesData.results[index].title,
                                pagesData.results[index].image,
                                pagesData.results[index].createdAt.toString(),
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 8 * h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 200 * h,
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(horizontal: 16 * w),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10 * o),
                                  child: CachedNetworkImage(
                                    imageUrl: pagesData.results[index].image,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            SizedBox(height: 16 * h),
                            Container(
                              margin: EdgeInsets.only(left: 16 * w),
                              child: Text(
                                pagesData.results[index].createdAt.toString(),
                                style: TextStyle(
                                  color: AppTheme.greycolor,
                                  fontSize: 13 * o,
                                  fontFamily: AppTheme.fontFamily,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(height: 4 * h),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 16 * w),
                              child: Expanded(
                                child: Text(
                                  pagesData.results[index].title,
                                  style: TextStyle(
                                    color: AppTheme.blackcolor,
                                    fontSize: 17 * o,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: AppTheme.fontFamily,
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                            ),
                            SizedBox(height: 16 * h),
                          ],
                        ),
                      ),
                    );
                  });
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}
