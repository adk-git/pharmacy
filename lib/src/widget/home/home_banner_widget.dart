import 'package:flutter/material.dart';

import '../../model/sale_model.dart';
import '../../utils/utils.dart';

class HomeBannerWidget extends StatelessWidget {
  final SaleModel saleData;

  const HomeBannerWidget({Key? key, required this.saleData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    double o = (h + w) / 2;
    return ListView.builder(
      itemCount: saleData.results.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Row(
          children: [
            SizedBox(width: 12 * w),
            SizedBox(
              height: 155 * h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10 * o),
                child: Image.network(
                  saleData.results[index].image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
