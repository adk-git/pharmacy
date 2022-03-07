import 'package:flutter/material.dart';
import 'package:pharmacy/src/api/repository.dart';
import 'package:pharmacy/src/app_theme/app_theme.dart';
import 'package:pharmacy/src/ui/auth/register_screen.dart';
import 'package:pharmacy/src/utils/utils.dart';

class VerificationScreen extends StatefulWidget {
  final String number2;

  const VerificationScreen({
    Key? key,
    required this.number2,
  }) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final codecontr = TextEditingController();

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
              padding: EdgeInsets.symmetric(horizontal: 16 * w),
              children: [
                SizedBox(height: 64 * h),
                SizedBox(
                  height: 38 * h,
                  child: Text(
                    "Проверочный код отправлен на номер",
                    style: TextStyle(
                      color: AppTheme.blackcolor,
                      fontSize: 13 * o,
                      fontFamily: AppTheme.fontFamily,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 4 * h),
                Text(
                  widget.number2,
                  style: TextStyle(
                    color: AppTheme.blackcolor,
                    fontSize: 16 * o,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16 * h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12 * w),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F3F5),
                    borderRadius: BorderRadius.circular(10 * o),
                  ),
                  height: 64 * h,
                  width: 343 * w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8 * h),
                      Expanded(
                        child: TextFormField(
                          controller: codecontr,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            fontSize: 16 * o,
                            fontFamily: AppTheme.fontFamily,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.25 * o,
                            color: AppTheme.blackcolor,
                          ),
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.close,
                                color: AppTheme.greycolor,
                              ),
                              onPressed: () {
                                codecontr.clear();
                              },
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 44 * h,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 12 * w),
            decoration: BoxDecoration(
              color: AppTheme.bluecolor,
              borderRadius: BorderRadius.circular(10 * o),
            ),
            child: ElevatedButton(
              onPressed: () {
                _sendData2();
              },
              child: Text(
                "Подтвердить номер",
                style: TextStyle(
                  color: AppTheme.maincolor,
                  fontSize: 17 * o,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppTheme.fontFamily,
                ),
              ),
            ),
          ),
          SizedBox(height: 24 * h),
        ],
      ),
    );
  }

  Future<void> _sendData2() async {
    var response = await Repository().getAccept(widget.number2, codecontr.text);
    if (response.isSuccess) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const RegisterScreen();
          },
        ),
      );
    }
  }
}
