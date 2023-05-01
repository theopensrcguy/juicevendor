import 'dart:async';

import 'package:flutter/material.dart';
import 'package:juice_vendor/screens/login.dart';
import 'package:juice_vendor/auth/main_page.dart';
import 'package:sizer/sizer.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 4), () {
      setState(() {
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (_) => const MainPage()), (
            route) => false);
      });
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Hero(tag: 'logo', child: Image.asset(
            'assets/images/jbar.png',
        height:  SizerUtil.deviceType == DeviceType.mobile ? 30.0.h
            : 20.0.h,
          width: SizerUtil.deviceType == DeviceType.mobile ? 60.0.w
          : 30.0.w,
        )),
      )
    );
  }
}
