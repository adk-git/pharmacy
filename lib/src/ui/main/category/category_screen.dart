import 'package:flutter/material.dart';
import 'package:pharmacy/src/bloc/catalog_bloc.dart';
import 'package:pharmacy/src/model/catalog_model.dart';
import 'package:pharmacy/src/ui/main/category/child/catalog_screen_child.dart';
import 'package:pharmacy/src/utils/utils.dart';
import 'package:pharmacy/src/widget/search_bar.dart';

import '../../../app_theme/app_theme.dart';
import '../home/best/best_drug_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
    catalogBloc.getCatalog();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    double o = (h + w) / 2;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.maincolor,
        automaticallyImplyLeading: false,
        toolbarHeight: 100 * h,
        elevation: 0,
        title: Column(
          children: [
            Text(
              "Каталог",
              style: TextStyle(
                color: AppTheme.blackcolor,
                fontSize: 17 * o,
                fontFamily: AppTheme.fontFamily,
              ),
            ),
            SizedBox(height: 16 * h),
            const SearchWidget(),
          ],
        ),
      ),
      backgroundColor: AppTheme.maincolor,
      body: ListView(
        scrollDirection: Axis.vertical,
        // shrinkWrap: true,
        children: [
          Column(
            children: [
              Container(
                child: StreamBuilder<CatalogModel>(
                    stream: catalogBloc.allCatalog,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        CatalogModel catalogData = snapshot.data!;
                        return ListView.builder(
                            itemCount: catalogData.results.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const ScrollPhysics(),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  if (catalogData
                                      .results[index].childs.isNotEmpty) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return CatalogChild(
                                            childs: catalogData
                                                .results[index].childs,
                                            name:
                                                catalogData.results[index].name,
                                          );
                                        },
                                      ),
                                    );
                                  } else {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return const BestDrugScreen();
                                    }));
                                  }
                                },
                                child: Container(
                                  height: 50 * h,
                                  margin: EdgeInsets.all(12 * o),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10 * o),
                                        child: Image.network(
                                          catalogData.results[index].image,
                                          height: 50 * h,
                                          width: 50 * w,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(width: 12 * w),
                                      Expanded(
                                        child: Text(
                                          catalogData.results[index].name,
                                          style: TextStyle(
                                            color: AppTheme.blackcolor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15 * o,
                                            fontFamily: AppTheme.fontFamily,
                                          ),
                                          maxLines: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      }
                      return const CircularProgressIndicator();
                    }),
              ),
            ],
          ),
          SizedBox(height: 32 * h),
        ],
      ),
    );
  }
}
