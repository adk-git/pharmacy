import 'package:flutter/material.dart';
import 'package:pharmacy/src/app_theme/app_theme.dart';
import 'package:pharmacy/src/utils/utils.dart';

import '../../../../model/catalog_model.dart';

class CatalogChild extends StatefulWidget {
  final List<CatalogResult> childs;
  final String name;

  const CatalogChild({
    Key? key,
    required this.childs,
    required this.name,
  }) : super(key: key);

  @override
  _CatalogChildState createState() => _CatalogChildState();
}

class _CatalogChildState extends State<CatalogChild> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    double o = (h + w) / 2;

    return Scaffold(
      backgroundColor: AppTheme.maincolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.maincolor,
        iconTheme: IconThemeData(
          color: AppTheme.bluecolor,
        ),
        title: Text(
          widget.name,
          style: TextStyle(
            color: AppTheme.blackcolor,
            fontSize: 18 * o,
            fontWeight: FontWeight.w500,
            fontFamily: AppTheme.fontFamily,
          ),
        ),
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: widget.childs.length,
          physics: const ScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              children: [
                SizedBox(height: 12 * h),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 12 * w),
                        child: Text(
                          widget.childs[index].name,
                          style: TextStyle(
                            fontSize: 16 * o,
                            fontFamily: AppTheme.fontFamily,
                            color: AppTheme.blackcolor,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 2,
                        ),
                      ),
                    ),
                    // const Spacer(),
                    Container(
                      margin: EdgeInsets.only(right: 12 * w),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: const Color(0xFFB8C1CC),
                        size: 17 * o,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 12 * h),
                  width: 360 * w,
                  height: 1 * h,
                  color: const Color(0xFFB8C1CC),
                ),
              ],
            );
          }),
    );
  }
}
