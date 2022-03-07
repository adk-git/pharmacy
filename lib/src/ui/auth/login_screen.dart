import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy/src/api/repository.dart';
import 'package:pharmacy/src/app_theme/app_theme.dart';
import 'package:pharmacy/src/ui/auth/verification_screen.dart';
import 'package:pharmacy/src/utils/utils.dart';
import 'package:pharmacy/src/widget/phone.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    double o = (h + w) / 2;

    return Scaffold(
      backgroundColor: AppTheme.maincolor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                SizedBox(
                  height: 64 * h,
                ),
                SvgPicture.asset("assets/icons/pharmacyicon.svg"),
                SizedBox(
                  height: 24 * h,
                ),
                SvgPicture.asset("assets/icons/pharmacyname.svg"),
                SizedBox(
                  height: 4 * h,
                ),
                Center(
                  child: Text(
                    "Аптечная сеть",
                    style: TextStyle(
                      color: AppTheme.greycolor,
                      fontSize: 13 * o,
                      fontFamily: AppTheme.fontFamily,
                    ),
                  ),
                ),
                SizedBox(
                  height: 24 * h,
                ),
                PhoneWidget(
                  controller: _numberController,
                ),
              ],
            ),
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Продолжая вы соглашаетесь с политикой обработки\n",
                      style: TextStyle(
                        color: const Color(0xFF6D7885),
                        fontSize: 11 * o,
                        fontFamily: AppTheme.fontFamily,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: "Персональных данных и Условиями продажи",
                      style: TextStyle(
                        color: AppTheme.bluecolor,
                        fontSize: 11 * o,
                        fontFamily: AppTheme.fontFamily,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 13 * h),
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
                _sendData();
              },
              child: Text(
                "Далее",
                style: TextStyle(
                  color: AppTheme.maincolor,
                  fontSize: 17 * o,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppTheme.fontFamily,
                ),
              ),
            ),
          ),
          SizedBox(height: 12 * h),
        ],
      ),
    );
  }

  Future<void> _sendData() async {
    var response = await Repository().getLogin(_numberController.text);
    if (response.isSuccess) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return VerificationScreen(
              number2: _numberController.text,
            );
          },
        ),
      );
    }
  }
}
