import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacy/src/ui/auth/login_screen.dart';
import 'package:pharmacy/src/utils/utils.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateHome();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    double o = (h + w) / 2;
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF3F8AE0),
      ),
      child: Container(
        child: SvgPicture.asset(
          "assets/icons/register1.svg",
          color: Colors.white,
        ),
        margin: EdgeInsets.symmetric(horizontal: 60 * h),
      ),
    );
  }

  Future<void> _navigateHome() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const LoginScreen();
        },
      ),
    );
  }
}
