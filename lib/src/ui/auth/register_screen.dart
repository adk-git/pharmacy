import 'package:flutter/material.dart';
import 'package:pharmacy/src/app_theme/app_theme.dart';
import 'package:pharmacy/src/ui/main/main_screen.dart';
import 'package:pharmacy/src/utils/utils.dart';
import 'package:pharmacy/src/widget/register_data.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  DateTime? date;
  bool gender = false;

  String getText() {
    if (date == null) {
      return "Select Date";
    } else {
      return '${date!.day}/${date!.month}/${date!.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    double o = (h + w) / 2;
    return Scaffold(
      backgroundColor: AppTheme.maincolor,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                SizedBox(height: 64 * h),
                Center(
                  child: Text(
                    "Ваши данные",
                    style: TextStyle(
                      color: AppTheme.blackcolor,
                      fontSize: 17 * o,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 25 * h),
                const Entering(
                  name: "Имя*",
                ),
                SizedBox(height: 12 * h),
                const Entering(
                  name: "Фамилия",
                ),
                SizedBox(height: 12 * h),
                GestureDetector(
                  onTap: () async {
                    final _now = DateTime.now();
                    final newDate = await showDatePicker(
                      context: context,
                      initialDate: date ?? _now,
                      firstDate: DateTime(1900, 02, 16),
                      lastDate: _now,
                    );
                    setState(() {
                      date = newDate;
                    });
                  },
                  child: Container(
                    height: 64 * h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10 * o),
                      color: const Color(0xFFF2F3F5),
                      border: Border.all(
                          color: const Color(0xFF000000), width: 0.5 * o),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 16 * w),
                    padding: EdgeInsets.symmetric(horizontal: 12 * w),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20 * h),
                      child: Text(getText()),
                    ),
                  ),
                ),
                SizedBox(height: 40 * h),
                Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          gender = true;
                        });
                      },
                      child: !gender
                          ? Container(
                              height: 22 * h,
                              width: 22 * w,
                              decoration: BoxDecoration(
                                  color: AppTheme.maincolor,
                                  borderRadius: BorderRadius.circular(12 * o),
                                  border: Border.all(
                                    width: 2 * o,
                                    color: const Color(0xFFB8C1CC),
                                  )),
                            )
                          : Container(
                              padding: EdgeInsets.all(8 * o),
                              height: 22 * h,
                              width: 22 * w,
                              decoration: BoxDecoration(
                                  color: AppTheme.bluecolor,
                                  borderRadius: BorderRadius.circular(12 * o),
                                  border: Border.all(
                                    width: 2 * o,
                                    color: const Color(0xFFB8C1CC),
                                  )),
                            ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16 * w),
                      child: Text(
                        "Мужчина",
                        style: TextStyle(
                          color: AppTheme.blackcolor,
                          fontWeight: FontWeight.w400,
                          fontSize: 15 * o,
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          gender = false;
                        });
                      },
                      child: gender
                          ? Container(
                              height: 22 * h,
                              width: 22 * w,
                              decoration: BoxDecoration(
                                  color: AppTheme.maincolor,
                                  borderRadius: BorderRadius.circular(12 * o),
                                  border: Border.all(
                                    width: 2 * o,
                                    color: const Color(0xFFB8C1CC),
                                  )),
                            )
                          : Container(
                              padding: EdgeInsets.all(8 * o),
                              height: 22 * h,
                              width: 22 * w,
                              decoration: BoxDecoration(
                                  color: AppTheme.bluecolor,
                                  borderRadius: BorderRadius.circular(12 * o),
                                  border: Border.all(
                                    width: 2 * o,
                                    color: const Color(0xFFB8C1CC),
                                  )),
                            ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16 * w),
                      child: Text(
                        "Женщина",
                        style: TextStyle(
                          color: AppTheme.blackcolor,
                          fontWeight: FontWeight.w400,
                          fontSize: 15 * o,
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context, MaterialPageRoute(builder: (context){
                return const MainScreen();
              }));
            },
            child: Container(
              height: 64 * h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10 * o),
                color: AppTheme.bluecolor,
                border: Border.all(width: 0.5 * o),
              ),
              margin: EdgeInsets.symmetric(horizontal: 16 * w),
              padding: EdgeInsets.symmetric(horizontal: 12 * w),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20 * h),
                child: Center(
                  child: Text(
                    "Сохранить",
                    style: TextStyle(
                      color: AppTheme.maincolor,
                      fontWeight: FontWeight.w500,
                      fontSize: 17 * o,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16 * h),
        ],
      ),
    );
  }
}
