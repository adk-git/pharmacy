import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/src/utils/utils.dart';

import '../../../../app_theme/app_theme.dart';

class NewsItemScreen extends StatefulWidget {
  final String name;
  final String image;
  final String data;

  const NewsItemScreen(this.name, this.image, this.data, {Key? key})
      : super(key: key);

  @override
  _NewsItemScreenState createState() => _NewsItemScreenState();
}

class _NewsItemScreenState extends State<NewsItemScreen> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    double o = (h + w) / 2;
    return Scaffold(
      body: ListView.builder(
        itemCount: 1,
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 375 * h,
                width: double.infinity,
                child: ClipRRect(
                  child: CachedNetworkImage(imageUrl: widget.image),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10 * o),
                    topRight: Radius.circular(10 * o),
                  ),
                ),
              ),
              SizedBox(height: 16 * h),
              Container(
                margin: EdgeInsets.only(left: 16 * w),
                child: Text(widget.data),
              ),
              SizedBox(height: 4 * h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16 * w),
                child: Expanded(
                  child: Text(
                    widget.name,
                    style: TextStyle(
                      color: AppTheme.blackcolor,
                      fontSize: 17 * o,
                      fontFamily: AppTheme.fontFamily,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32 * h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16 * w),
                child: Expanded(
                  child: Text(
                    "Вы когда-нибудь говорили о недержании с родными или друзьями? А с доктором? Эта тема кажется неудобной, и потому люди стесняются говорить о неприятных симптомах, столкнувшись с недержанием."
                    "Инконтиненция бывает не только у прикованных к постели людей с серьезными заболеваниями: подвижные женщины и мужчины тоже сталкиваются с недержанием мочи. Чтобы не бояться протекания или появления неприятного запаха в общественных местах, они используют специальные абсорбирующие изделия – урологические прокладки, вкладыши и подгузники-трусы."
                    "Если прокладки или вкладыши впитывают недостаточно, некоторые приобретают классические подгузники. Но классические подгузники из-за особенностей конструкции создают дискомфорт при ходьбе – сползают, расстегиваются, – а также выделяются под одеждой. Поэтому для подвижных женщин и мужчин созданы подгузники-трусы, которые похожи на обычное белье, незаметны под одеждой и не сковывают движений.",
                    style: TextStyle(
                      color: const Color(0xFF2C2D2E),
                      fontSize: 12 * o,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppTheme.fontFamily,
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
